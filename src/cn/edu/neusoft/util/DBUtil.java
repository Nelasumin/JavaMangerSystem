package cn.edu.neusoft.util;

import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cn.edu.neusoft.common.Const;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class DBUtil {
	private String driver;
	private String url;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String username;
	private String password;
	private static Connection conn = null;// 连接对象

	private static PreparedStatement pstmt = null;// 语句对象

	private static ResultSet rs = null;// 结果集对象

	//private static String datasourceName = Const.DATA_SOURCE;// 数据源名称

	public DBUtil() {
		driver="com.mysql.cj.jdbc.Driver";
		url="jdbc:mysql://bj-cynosdbmysql-grp-ep5jkzpw.sql.tencentcdb.com:24353/staff?useSSL=false&useLegacyDatetimeCode=false&allowPublicKeyRetrieval=true&useJDBCCompliantTimezoneShift=true&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
		username="root";
		password="Ha777666";
	}
	private  void init() throws SQLException
	{
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 获取连接对象
	public Connection getConnection() throws SQLException{
		init();
		return conn;
	}

	// 获取语句对象
	private PreparedStatement getPrepareStatement(String sql)
			throws NamingException, SQLException {
		if(conn==null||conn.isClosed())
			pstmt = getConnection().prepareStatement(sql);
		else
			pstmt = conn.prepareStatement(sql);
		return pstmt;
	}

	// 关闭对象
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 遍历参数数组，将数组中的值按位置一一对应地对pstmt所代表的SQL语句中的参数进行设置
	private  void setParams(String sql, Object[] params) throws NamingException,
			SQLException {
		pstmt = getPrepareStatement(sql);
		for (int i = 0; i < params.length; i++)
			pstmt.setObject(i + 1, params[i]);
	}

	// 从结果集中得到一个对象
	private  Object getObjectFromRS(String sql, Object[] params)
			throws NamingException, SQLException {
		Object o = null;
		setParams(sql, params);// 根据sql语句和params，设置pstmt对象
		rs = pstmt.executeQuery();
		if (rs.next())
			o = rs.getObject(1);
		return o;
	}

	// 将结果集中封装成一个List
	private  List getListFromRS() throws NamingException, SQLException {
		List list = new ArrayList();
		// 获取元数据
		ResultSetMetaData rsmd = rs.getMetaData();

		while (rs.next()) {
			Map m = new HashMap();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				// 获取当前行第i列的数据类型
				String colType = rsmd.getColumnTypeName(i);
				// 获取当前行第i列的列名
				String colName = rsmd.getColumnName(i).toLowerCase();
				String s = rs.getString(colName);
				if (s != null) {
					//System.out.println(colType+colName);
					if (colType.equals("INTEGER")||colType.equals("INT"))
						m.put(colName, new Integer(rs.getInt(colName)));
					else if (colType.equals("FLOAT"))
						m.put(colName, new Float(rs.getFloat(colName)));
					else{
						// 其余类型均作为String对象取出
						m.put(colName, rs.getString(colName));
						//System.out.println("==="+m);
					}

				}
			}
			list.add(m);
		}
		return list;
	}

	// 分页显示，获取页号为curPage的本页所有记录
	// 返回的Map对象中存放两个元素：
	// key="list"的元素是存放了本页所有记录的List对象，
	// key="totalPage"的元素是代表总页数的Long对象
	public  Map getPage(String sql, Object[] params, String curPage) {
		String s_page_rec_num = Const.PAGE_REC_NUM;
		int i_page_rec_num = Integer.parseInt(s_page_rec_num);
		Map page = new HashMap();
		try {
			String newSql = sql + " limit " + (Integer.parseInt(curPage) - 1)
					* i_page_rec_num + "," + i_page_rec_num;
			List pagingList = getList(newSql, params);// 根据RS得到list
			close();

			// 计算总页数			
			sql = sql.toLowerCase();
			String countSql="";
			if(sql.indexOf("group")>=0)
				countSql = "select count(*) as num from ("+sql+") as temp";
			else
				countSql = "select count(*) as num from (" +sql+") as temp";
			//+ sql.substring(sql.indexOf("from"));
			System.out.println(countSql);
			// count中存放总记录数 
			long count= getLong(countSql, params);

			System.out.println("count:" + count);

			// 利用总记录数（count）和每页记录个数（Const.PAGE_REC_NUM）计算总页数
			long totalPage = 0;
			if (count % i_page_rec_num == 0)
				totalPage = count / i_page_rec_num;
			else
				totalPage = count / i_page_rec_num + 1;

			// 返回的List对象page中，下标为0的元素为存放当前分页所有记录的List对象pagingList，下标为1的元素为总页数
			page.put("list", pagingList);
			page.put("totalPage", new Long(totalPage));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return page;
	}

	public  Map getPage(String sql, String curPage) {
		return getPage(sql, new Object[] {}, curPage);
	}

	// 查询获取List对象
	public  List getList(String sql, Object[] params) {
		List list = null;// 定义保存查询结果的集合对象
		try {
			setParams(sql, params);// 根据sql语句和params，设置pstmt对象
			rs = pstmt.executeQuery();// 执行SQL语句，得到结果集
			list = getListFromRS();// 根据RS得到list
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public  List getList(String sql) {
		return getList(sql, new Object[] {});
	}

	// 查询获取Map对象
	public Map getMap(String sql, Object[] params) {
		Map m = null;
		try {
			setParams(sql, params);// 根据sql语句和params，设置pstmt对象
			rs = pstmt.executeQuery();
			List l = getListFromRS();
			if (l != null && l.size()!=0)
				m = (Map) (l.get(0));// 根据RS得到Map

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return m;
	}

	public  Map getMap(String sql) {
		return getMap(sql, new Object[] {});
	}

	// 查询获得long型数
	public  long getLong(String sql, Object[] params) {
		long l = 0;
		try {
			Object temp = getObjectFromRS(sql, params);
			if(temp!=null)
				l = ((Long)temp).longValue();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return l;
	}

	// 查询获得int型数
	public  int getInt(String sql, Object[] params) {
		int i = 0;
		try {
			Object temp = getObjectFromRS(sql, params);
			if(temp!=null)
				i = ((Integer)temp).intValue();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public int getInt(String sql) {
		return getInt(sql, new Object[] {});
	}

	// 查询获得String对象
	public String getString(String sql, Object[] params) {
		String str = null;
		try {
			Object temp = getObjectFromRS(sql, params);
			if(temp!=null)
				str = (String)temp;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return str;
	}

	public  String getString(String sql) {
		return getString(sql, new Object[] {});
	}

	// 增加、修改和删除均可以调用update方法
	public  int update(String sql, Object[] params) {
		int recNo = 0;// 表示受影响的记录行数
		try {
			setParams(sql, params);// 根据sql语句和params，设置pstmt对象
			recNo = pstmt.executeUpdate();// 执行更新操作
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return recNo;
	}

	public  int update(String sql) {
		return update(sql, new Object[] {});
	}

	// 需要事务处理的增加、修改和删除均可以调用updateTA方法
	public  int updateTA(String sql, Object[] params) throws NamingException, SQLException {
		int recNo = 0;// 表示受影响的记录行数

		setParams(sql, params);// 根据sql语句和params，设置pstmt对象
		recNo = pstmt.executeUpdate();// 执行更新操作

		return recNo;
	}

	public  int updateTA(String sql) throws NamingException, SQLException {
		return updateTA(sql, new Object[] {});
	}

	// 将Map对象转换为Object数组
	public Object[] getObjectArrayFromMap(Map map, String key) {
		String[] keys = key.split(",");
		Object[] tmp = new Object[keys.length];
		for (int i = 0; i < keys.length; i++) {
			tmp[i] = map.get(keys[i].trim());
		}
		return tmp;
	}


}

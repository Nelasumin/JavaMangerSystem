<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <%-- <link href="CSS/LoginStyle.css" rel="stylesheet" type="text/css" /> --%>
    <style type="text/css">
        body
{
    font-size: small;
    background-image: url('images/bg.jpg');
    margin: auto;
    background-repeat: repeat-x;
    text-align: center;
}
#main
{
    margin: auto;
    width: 900px;
    text-align: center;
}
#Logo
{
    margin: auto;
    background-image: url('images/task_banner.gif');
    background-repeat: no-repeat;
    height: 110px;
    width: 884px;
}
#LoginMain
{
    margin: auto;
    background-image: url('images/userLoginBg.jpg');
    background-repeat: no-repeat;
    height: 300px;
    position: relative;
    top: 0px;
    left: 0px;
}
#Login_Table
{
    position: absolute;
    top: 120px;
    left: 219px;
    height: 77px;
    width: 394px;
    color: #FFFFFF;
    bottom: 103px;
}
.btn {
	background-image:url('/images/btn.jpg');
	height:72px;
	width: 90px;
}
    </style>
</head>
<body>
    <div id="main">
       <div id="Logo"></div>
       <div id="LoginMain">
        <form id="form1" runat="server">
          <div id="Login_Table">
              <table>
                  <tr>
                      <td>
                          用户名：</td>
                      <td>
                     <asp:TextBox ID="username" runat="server"></asp:TextBox>
                      </td>
                      <td rowspan="3" colspan="3">
                          <asp:Button ID="sm" CssClass="btn" runat="server" OnClick="sm_Click" />
                         <%-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/btn.jpg" 
                              onclick="ImageButton1_Click" />--%>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          密码：</td>
                      <td>
                        <asp:TextBox ID="password" runat="server"></asp:TextBox>
                         <%-- <asp:TextBox ID="TextBox2" runat="server" Width="216px"></asp:TextBox>--%>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          验证码：</td>
                      <td>
                     <%-- <input type="text" id="TextBox3" />--%>
                          <asp:TextBox ID="TextBox3" runat="server" Width="126px"></asp:TextBox>
                          <%--<asp:ImageButton ID="invalidate" runat="server" AlternateText="验证码"/>
                         <%-- <asp:ImageButton ID="ImageButton2" runat="server" 
                              onclick="ImageButton2_Click" Height="16px" />--%>
                      </td>
                  </tr>
              </table>
          </div>
        </form>
       </div>
    </div>
</body>
</html>

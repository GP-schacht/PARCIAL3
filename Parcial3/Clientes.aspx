<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Parcial3.Clientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clientes - Listado</title>
    <style>
        .error { color: #c00; margin-top:8px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Clientes</h2>

        <asp:Label ID="lblError" runat="server" CssClass="error" />

        <asp:GridView ID="gvClientes" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="cliente_id"
            AllowPaging="True"
            PageSize="10"
            OnPageIndexChanging="gvClientes_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="cliente_id" HeaderText="ID" />
                <asp:BoundField DataField="cliente_nam" HeaderText="Nombre" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
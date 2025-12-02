<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Abogados.aspx.cs" Inherits="Parcial3.Abogados" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Abogados - Listado</title>
    <style>
        .error { color: #c00; margin-top:8px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Abogados</h2>

        <asp:Label ID="lblError" runat="server" CssClass="error" />

        <asp:GridView ID="gvAbogados" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="abogado_id"
            AllowPaging="True"
            PageSize="10"
            OnPageIndexChanging="gvAbogados_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="abogado_id" HeaderText="ID" />
                <asp:BoundField DataField="abogado_nam" HeaderText="Nombre" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
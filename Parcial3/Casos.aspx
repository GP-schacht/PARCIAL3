
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Casos.aspx.cs" Inherits="BuffeteWeb.Casos" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Gestión de Casos</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Listado de Casos</h2>
        <asp:TextBox ID="txtFiltroCliente" runat="server" Placeholder="Buscar por Cliente"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
        <asp:GridView ID="gvCasos" runat="server" AutoGenerateColumns="False" DataKeyNames="caso_id">
            <Columns>
                <asp:BoundField DataField="caso_id" HeaderText="ID" />
                <asp:BoundField DataField="inicio_dte" HeaderText="Inicio" />
                <asp:BoundField DataField="final_dte" HeaderText="Final" />
                <asp:BoundField DataField="estatus_dsc" HeaderText="Estatus" />
                <asp:ButtonField Text="Detalle" CommandName="Detalle" />
                <asp:ButtonField Text="Editar" CommandName="Editar" />
                <asp:ButtonField Text="Eliminar" CommandName="Eliminar" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Caso" OnClick="btnNuevo_Click" />
    </form>
</body>
</html>


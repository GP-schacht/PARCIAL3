<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="casoNuevo.aspx.cs" Inherits="Parcial3.casoNuevo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nuevo Caso</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Crear Nuevo Caso</h2>

        <asp:ValidationSummary ID="vsSummary" runat="server" CssClass="validation-summary" ShowMessageBox="false" />

        <div>
            <label for="txtInicio">Fecha Inicio:</label><br />
            <asp:TextBox ID="txtInicio" runat="server" TextMode="Date" />
            <asp:RequiredFieldValidator ID="rfvInicio" runat="server"
                ControlToValidate="txtInicio" ErrorMessage="La fecha de inicio es requerida." Display="Dynamic" />
        </div>

        <div>
            <label for="txtFinal">Fecha Final:</label><br />
            <asp:TextBox ID="txtFinal" runat="server" TextMode="Date" />
            <asp:RequiredFieldValidator ID="rfvFinal" runat="server"
                ControlToValidate="txtFinal" ErrorMessage="La fecha final es requerida." Display="Dynamic" />
        </div>

        <div>
            <label for="ddlEstatus">Estatus:</label><br />
            <asp:DropDownList ID="ddlEstatus" runat="server" />
            <asp:RequiredFieldValidator ID="rfvEstatus" runat="server"
                ControlToValidate="ddlEstatus" InitialValue="" ErrorMessage="Seleccione un estatus." Display="Dynamic" />
        </div>

        <div>
            <label for="ddlCliente">Cliente:</label><br />
            <asp:DropDownList ID="ddlCliente" runat="server" />
            <asp:RequiredFieldValidator ID="rfvCliente" runat="server"
                ControlToValidate="ddlCliente" InitialValue="" ErrorMessage="Seleccione un cliente." Display="Dynamic" />
        </div>

        <div>
            <label for="ddlAbogado">Abogado:</label><br />
            <asp:DropDownList ID="ddlAbogado" runat="server" />
            <asp:RequiredFieldValidator ID="rfvAbogado" runat="server"
                ControlToValidate="ddlAbogado" InitialValue="" ErrorMessage="Seleccione un abogado." Display="Dynamic" />
        </div>

        <br />
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />

        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </form>
</body>
</html>
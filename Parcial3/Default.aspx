<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BuffeteWeb.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Buffete Jurídico</title>
    <style>
        body { font-family: Segoe UI, Arial, sans-serif; margin: 20px; color: #333; }
        .topbar { display:flex; align-items:center; justify-content:space-between; margin-bottom:20px; }
        .brand { font-size: 1.6em; font-weight:600; }
        .menu { list-style:none; margin:0; padding:0; display:flex; gap:8px; }
        .menu a, .menu .aspLink { display:inline-block; padding:8px 12px; background:#0078d7; color:#fff; text-decoration:none; border-radius:4px; }
        .menu a:hover, .menu .aspLink:hover { background:#005ea6; }
        .grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap:16px; margin-top:18px; }
        .card { background:#fff; border:1px solid #e1e1e1; padding:18px; border-radius:6px; text-align:center; box-shadow:0 1px 3px rgba(0,0,0,0.05); }
        .card a, .card .aspBtn { display:block; font-size:1.05em; color:#0078d7; text-decoration:none; margin-top:10px; }
        .card .btn, .card .aspBtn { display:inline-block; margin-top:12px; padding:8px 12px; background:#0078d7; color:#fff; border-radius:4px; }
        .card .btn:hover, .card .aspBtn:hover { background:#005ea6; }
        .note { color:#666; font-size:0.95em; margin-top:8px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="topbar">
            <div class="brand">Buffete Jurídico — Panel principal</div>
            <ul class="menu" role="menubar">
                <li role="none"><asp:HyperLink ID="hlCasos" runat="server" NavigateUrl="~/Casos.aspx" CssClass="aspLink" Role="menuitem">Casos</asp:HyperLink></li>
                <li role="none"><asp:HyperLink ID="hlClientes" runat="server" NavigateUrl="~/Clientes.aspx" CssClass="aspLink" Role="menuitem">Clientes</asp:HyperLink></li>
                <li role="none"><asp:HyperLink ID="hlDocumentos" runat="server" NavigateUrl="~/Documentos.aspx" CssClass="aspLink" Role="menuitem">Documentos</asp:HyperLink></li>
                <li role="none"><asp:HyperLink ID="hlAbogados" runat="server" NavigateUrl="~/Abogados.aspx" CssClass="aspLink" Role="menuitem">Abogados</asp:HyperLink></li>
                <li role="none"><asp:HyperLink ID="hlAgenda" runat="server" NavigateUrl="~/Agenda.aspx" CssClass="aspLink" Role="menuitem">Agenda</asp:HyperLink></li>
            </ul>
        </div>

        <h2>Accesos rápidos</h2>
        <div class="grid">
            <div class="card">
                <div style="font-weight:600">Casos</div>
                <div class="note">Ver, buscar y administrar casos registrados.</div>
                <asp:HyperLink ID="hlCasosBtn" runat="server" NavigateUrl="~/Casos.aspx" CssClass="btn aspBtn">Ir a Casos</asp:HyperLink>
            </div>

            <div class="card">
                <div style="font-weight:600">Nuevo Caso</div>
                <div class="note">Crear un nuevo expediente/caso.</div>
                <asp:HyperLink ID="hlNuevoCaso" runat="server" NavigateUrl="~/casoNuevo.aspx" CssClass="btn aspBtn">Crear Caso</asp:HyperLink>
            </div>

            <div class="card">
                <div style="font-weight:600">Clientes</div>
                <div class="note">Administrar clientes y sus datos de contacto.</div>
                <asp:HyperLink ID="hlClientesBtn" runat="server" NavigateUrl="~/Clientes.aspx" CssClass="btn aspBtn">Ir a Clientes</asp:HyperLink>
            </div>

            <div class="card">
                <div style="font-weight:600">Documentos</div>
                <div class="note">Subir y revisar documentos por caso.</div>
                <asp:HyperLink ID="hlDocumentosBtn" runat="server" NavigateUrl="~/Documentos.aspx" CssClass="btn aspBtn">Ir a Documentos</asp:HyperLink>
            </div>

            <div class="card">
                <div style="font-weight:600">Abogados</div>
                <div class="note">Listado y asignación de abogados.</div>
                <asp:HyperLink ID="hlAbogadosBtn" runat="server" NavigateUrl="~/Abogados.aspx" CssClass="btn aspBtn">Ir a Abogados</asp:HyperLink>
            </div>

            <div class="card">
                <div style="font-weight:600">Agenda</div>
                <div class="note">Ver citas y audiencias programadas.</div>
                <asp:HyperLink ID="hlAgendaBtn" runat="server" NavigateUrl="~/Agenda.aspx" CssClass="btn aspBtn">Ir a Agenda</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
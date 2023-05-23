<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="SAC_Enci_Proyecto.CrearCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="Images/logo2.png">
    <title>Crear Cuenta</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Estilo.css">
    <style type="text/css">
        .auto-style1 {
            width: 28%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav id="superior" class="container-fluid p-3">
                <img src="images/logo2.png" alt="logo">
                &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
            </nav>
        </header>

        <section class="pt-5">

            <div class="login-box mt-5">
                <h2>CREAR CUENTA</h2>
                <form>
                    <div class="user-box">
                        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                        <label>Usuario</label>
                    </div>
                    <div class="user-box">
                        <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
                        <label>Contraseña</label>
                    </div>
                    <center>
                        <asp:Button ID="btnAtras" runat="server" Text="Regresar" class="btn btn-warning" OnClick="btnAtras_Click" />
                        <asp:Button ID="btnCrearCuenta" runat="server" Text="Crear cuenta" class="btn btn-warning" OnClick="btnCrearCuenta_Click" />
                    </center>
                </form>
            </div>
            <br />
            <br />
            <br />
        </section>

    </form>

</body>
</html>

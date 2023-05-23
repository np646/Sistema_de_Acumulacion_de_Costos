<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="SAC_Enci_Proyecto.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="Images/logo2.png"/>
    <title>Iniciar sesión</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/Estilo.css"/>


    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav id="superior" class="container-fluid p-3">
                <img src="images/logo2.png" alt="logo"/>
                &nbsp;&nbsp;
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
            </nav>
        </header>

        <section class="pt-5">

            <div class="login-box mt-5">
                <h2>INICIAR SESIÓN</h2>
                <form>
                    <div class="user-box">
                        <asp:TextBox ID="txtUsuario" name="" runat="server"></asp:TextBox>
                        <label>Usuario</label>
                    </div>
                    <div class="user-box">
                        <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
                        <label>Contraseña</label>
                    </div>
                    <center>
                        <asp:Button ID="btnIniciarSesion" runat="server" Text="Ingresar" class="btn btn-warning" OnClick="btnIniciarSesion_Click" /></center>
                    <br/>
                    <p>¿No tienes una cuenta? <a href="CrearCuenta.aspx">Regístrate aquí</a></p>
                </form>
            </div>
        </section>
        
    
    </form>
</body>
</html>

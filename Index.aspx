<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SAC_Enci_Proyecto.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="Images/logo2.png">
    <title>Inicio</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Intro.css">
    

    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
    

</head>
<body>
    <form id="form1" runat="server">
    <div class="headers">
        <nav id="superior" class="container-fluid p-3">
            <img src="images/logo2.png" alt="logo">
            
            <p class="auto-style1"><strong>Sistema de Acumulaci&oacute;n de Costos</strong></p>
        </nav>
        <div id="main" class="inner-header flex">
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-6" OnClick="btnIngresar_Click"/>
         </div>
    </div>
    <!--Waves Container-->
        <div>
            <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                <defs>
                    <path id="gentle-wave"
                        d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                </defs>
                <g class="parallax">
                    <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
                    <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
                    <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
                    <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
                </g>
            </svg>
        </div>
        <!--Waves end-->
        


    <footer>
        <div class="content flex">
            <h3>Sistema de Acumulaci&oacute;n de Costos</h3><br />
            
        </div>
    </footer>
        </form>
</body>
</html>

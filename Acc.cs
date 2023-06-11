using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace SAC_Enci_Proyecto 
{
    public class Acc
    {
        AccesoDatos conectar = new AccesoDatos("bdd_enciConnectionString"); 
        public DataSet insertUsuario(string strNombre, string strContrasena)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_USUARIO");
            conectar.AsignarParametros("nombre", strNombre, DbType.String);
            conectar.AsignarParametros("contrasena", strContrasena, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet selectVerificarUsuario(string strUsuario, string strContrasena)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_VERIFICARUSUARIO");
            conectar.AsignarParametros("usuario", strUsuario, DbType.String);
            conectar.AsignarParametros("pass", strContrasena, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertRegistro(string strUsuario)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_REGISTRO");
            conectar.AsignarParametros("nombre", strUsuario, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
		public DataSet updateRegistro()
        {
			//se llama esta función cuando el usuario cierra sesión
			
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_REGISTRO");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
		
		public DataSet selectRegistros()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_REGISTROS");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectCostoEgresoPorTipo(int intOprid, string strClasificacion)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_COSTOEGRESOTIPO");
            conectar.AsignarParametros("oprid", intOprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("clasificacion", strClasificacion, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }


        public DataSet insertIVA(double dblValor)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_IVA");
            conectar.AsignarParametros("valor", dblValor.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet selectIVAActual()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_IVAACTUAL");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectReporteIVA(string strFechaInicio, string strFechaFin)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_REPORTEIVA");
            conectar.AsignarParametros("inicio", strFechaInicio, DbType.String);
            conectar.AsignarParametros("fin", strFechaFin, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
		
		public DataSet selectReporteGastos(string strFechaInicio, string strFechaFin, string strClasificacion)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_REPORTEGASTOS");
            conectar.AsignarParametros("inicio", strFechaInicio, DbType.String);
            conectar.AsignarParametros("fin", strFechaFin, DbType.String);
            conectar.AsignarParametros("clasificacion", strClasificacion, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertPedido(int intCliid )
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_PEDIDO");
            conectar.AsignarParametros("cliid", intCliid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectUltimoPedido()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_ULTIMOPEDIDO");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertItem(int intCliid,int intCantidad, string strDetalle, double dblPvp, string strFechainicio, string strFechafin, string strDescripcion, int intNumpedido, double dblTotal)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_ITEM");
            conectar.AsignarParametros("cliid", intCliid.ToString(), DbType.Int32);
            conectar.AsignarParametros("itmcantidad", intCantidad.ToString(), DbType.Int32);
            conectar.AsignarParametros("prodetalle", strDetalle, DbType.String);
            conectar.AsignarParametros("propvp", dblPvp.ToString(), DbType.Double);
            conectar.AsignarParametros("itmfechainicio", strFechainicio, DbType.String);
            conectar.AsignarParametros("itmfechafin", strFechafin, DbType.String);
            conectar.AsignarParametros("itmdescripcion", strDescripcion, DbType.String);
            conectar.AsignarParametros("itmnumpedido", intNumpedido.ToString(), DbType.Int32);
            conectar.AsignarParametros("itmtotal", dblTotal.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertOrdenProduccion(int intItemid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_ORDENPRODUCCION");
            conectar.AsignarParametros("itemid", intItemid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectUltimaOP()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_ULTIMAORDENPRODUCCION");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertListaEgresos(string strDetalle, string strRuc, string strAutorizacion, string strNombre, string strClasificacion, int intCantidad, double dblCunitario, double dblIVA)
        { 
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_LISTAEGRESOS");
            conectar.AsignarParametros("egrdetalle", strDetalle, DbType.String);
            conectar.AsignarParametros("prvruc", strRuc, DbType.String);
            conectar.AsignarParametros("prvautorizacion", strAutorizacion, DbType.String);
            conectar.AsignarParametros("prvnombre", strNombre, DbType.String);
            conectar.AsignarParametros("egrclasificacion", strClasificacion, DbType.String);
            conectar.AsignarParametros("egrcantidad", intCantidad.ToString(), DbType.Int32);
            conectar.AsignarParametros("egrcunitario", dblCunitario.ToString(), DbType.Double);
            conectar.AsignarParametros("iva", dblIVA.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectUltimaListaEgresos()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_ULTIMALISTAEGRESOS");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet insertCostoPorOrden(int intOprid, int intLegrid, string strComentario)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_COSTOPORORDEN");
            conectar.AsignarParametros("oprid", intOprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("legrid", intLegrid.ToString(), DbType.Int32);
            conectar.AsignarParametros("comentario", strComentario, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

  
        public DataSet selectOPporItemID(int intItemid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_OPPORITEMID");
            conectar.AsignarParametros("itemid", intItemid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectUltimoItem()
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_ULTIMOITEM");
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertDetalleOrden(int intOprid, int intLegrid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_DETALLEORDEN");
            conectar.AsignarParametros("oprid", intOprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("legrid", intLegrid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
  
        public DataSet insertDetallePedido(int intPedid, int intItemid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_DETALLEPEDIDO");
            conectar.AsignarParametros("pedidoid", intPedid.ToString(), DbType.Int32);
            conectar.AsignarParametros("itemid", intItemid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectCliente(string strId)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_CLIENTEPORID");
            conectar.AsignarParametros("cliid", strId.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet insertCliente(string strNombre, string strIdentificacion)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_CLIENTE");
            conectar.AsignarParametros("nombre", strNombre, DbType.String);
            conectar.AsignarParametros("identificacion", strIdentificacion, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectTotalPorOP(int intOprid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_TOTALPOROP");
            conectar.AsignarParametros("oprid", intOprid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet selectTotalPorPedido(int intPedid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_TOTALPORPEDIDO");
            conectar.AsignarParametros("pedid", intPedid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectCUnitarioOP(double dblTotal, int intCantidad)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_CUNITARIOOP");
            conectar.AsignarParametros("total", dblTotal.ToString(), DbType.Double);
            conectar.AsignarParametros("cantidad", intCantidad.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        //`SP_UPDATE_ORDENPRODUCCION`(in oprid int, in total double, in cunitario double)

        public DataSet updateOP(int intOprid, double dblTotal, double intCunitario)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_ORDENPRODUCCION");
            conectar.AsignarParametros("oprid", intOprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("total", dblTotal.ToString(), DbType.Double);
            conectar.AsignarParametros("cunitario", intCunitario.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        public DataSet updatePedido(int intPedid, double dblTotal)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_PEDIDO");
            conectar.AsignarParametros("pedid", intPedid.ToString(), DbType.Int32);
            conectar.AsignarParametros("total", dblTotal.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        //PROCEDURE `SP_SELECT_REPORTETOTALGASTOS`(in inicio varchar(45), in fin varchar(45), in clasificacion int)


        public DataSet selectReporteTotalGastos(string strFechaInicio, string strFechaFin, string strClasificacion)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_REPORTETOTALGASTOS");
            conectar.AsignarParametros("inicio", strFechaInicio, DbType.String);
            conectar.AsignarParametros("fin", strFechaFin, DbType.String);
            conectar.AsignarParametros("clasificacion", strClasificacion, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }


        /////////
        public DataSet deleteCliente(int intCliid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_DELETE_CLIENTEPORID");

            conectar.AsignarParametros("cliid", intCliid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }


        public DataSet selectProductoPorItem(int intItmid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_PRODUCTOPORITEM");
            conectar.AsignarParametros("itmid", intItmid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }


        public DataSet updateItem(int intCantidad, string strDetalle, double dblPvp, string strDescripcion, int intItmid, int intProid, double dblTotal)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_ITEM");
            conectar.AsignarParametros("itmcantidad", intCantidad.ToString(), DbType.Int32);
            conectar.AsignarParametros("prodetalle", strDetalle, DbType.String);
            conectar.AsignarParametros("propvp", dblPvp.ToString(), DbType.Double);
            conectar.AsignarParametros("itmdescripcion", strDescripcion, DbType.String);

            conectar.AsignarParametros("itmid", intItmid.ToString(), DbType.Int32);
            conectar.AsignarParametros("proid", intProid.ToString(), DbType.Int32);
            conectar.AsignarParametros("total", dblTotal.ToString(), DbType.Double);

            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet deleteDetallePedido(int intItmid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_DELETE_DPEDPORITEMID");

            conectar.AsignarParametros("itmid", intItmid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectProveedorPorLegrid(int intlegrid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_PROVEEDORPORLEGR");
            conectar.AsignarParametros("legrid", intlegrid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }


        public DataSet updateLegreso(string strEgrdetalle, string strPrvruc, string strPrvautorizacion, string strPrvnombre, int intEgrcantidad, double dblEgrcostounitario, double dblIva, string strEgrclasificacion, int intLegrid, int intPrvid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_LEGRESO");
            conectar.AsignarParametros("egrdetalle", strEgrdetalle.ToString(), DbType.String);
            conectar.AsignarParametros("prvruc", strPrvruc, DbType.String);
            conectar.AsignarParametros("prvautorizacion", strPrvautorizacion, DbType.String);
            conectar.AsignarParametros("prvnombre", strPrvnombre, DbType.String);
            conectar.AsignarParametros("egrcantidad", intEgrcantidad.ToString(), DbType.Int32);
            conectar.AsignarParametros("egrcostounitario", dblEgrcostounitario.ToString(), DbType.Double);
            conectar.AsignarParametros("iva", dblIva.ToString(), DbType.Double);
            conectar.AsignarParametros("egrclasificacion", strEgrclasificacion, DbType.String);
            conectar.AsignarParametros("legrid", intLegrid.ToString(), DbType.Int32);
            conectar.AsignarParametros("prvid", intPrvid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet deleteLegreso(int intLegrid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_DELETE_LEGRESO");

            conectar.AsignarParametros("legrid", intLegrid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet deleteOrdenProduccion(int intOprid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_DELETE_ORDENPRODUCCION");

            conectar.AsignarParametros("Oprid", intOprid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet updateCliente(string strClinombre, string strCliidentificacion, int intCliid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_UPDATE_CLIENTE");
            conectar.AsignarParametros("clinombre", strClinombre.ToString(), DbType.String);
            conectar.AsignarParametros("cliidentificacion", strCliidentificacion, DbType.String);
            conectar.AsignarParametros("cliid", intCliid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectPedido(int intPedid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_PEDIDO");
            conectar.AsignarParametros("pedido_id", intPedid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        ///////20230527/////////////
        
        public DataSet insertProveedor(string strRUC, string strAutorizacion, string strNombre)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_PROVEEDOR");
            conectar.AsignarParametros("ruc", strRUC, DbType.String);
            conectar.AsignarParametros("autorizacion", strAutorizacion, DbType.String);
            conectar.AsignarParametros("nombre", strNombre, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
        // mprcodigo varchar(45), mprdetalle varchar(45), in prvid int

        public DataSet insertMateriaPrima(string strCodigo, string strDetalle, int prvId)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_MATERIAPRIMA");
            conectar.AsignarParametros("mprcodigo", strCodigo, DbType.String);
            conectar.AsignarParametros("mprDetalle", strDetalle, DbType.String);
            conectar.AsignarParametros("prvid", prvId.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        ///KARDEX///
        ///in mprid int, in cantidad double, in cunitario double
        public DataSet insertEntradaKardex(int intMprid, double dblCantidad, double dblCunitario)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_ENTRADA_KARDEX");
            conectar.AsignarParametros("mprid", intMprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("cantidad", dblCantidad.ToString(), DbType.Double);
            conectar.AsignarParametros("cunitario", dblCunitario.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet insertSalidaKardex(int intMprid, double dblCantidad)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_INSERT_SALIDA_KARDEX");
            conectar.AsignarParametros("mprid", intMprid.ToString(), DbType.Int32);
            conectar.AsignarParametros("cantidad", dblCantidad.ToString(), DbType.Double);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectMateriaPrimaPorID(int intMprid)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_MATERIAPRIMAPORID");
            conectar.AsignarParametros("mprid", intMprid.ToString(), DbType.Int32);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }

        public DataSet selectMateriaPrimaPorCodigo(string strMprCodigo)
        {
            conectar.Conectar();
            conectar.CrearComando("SP_SELECT_MATERIAPRIMAPORCODIGO");
            conectar.AsignarParametros("mprcodigo", strMprCodigo, DbType.String);
            DataSet dsDatos = conectar.EjecutarDataset();
            conectar.Desconectar();
            return dsDatos;
        }
    }
}


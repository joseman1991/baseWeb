
<%@page import="Entidades.Cliente"%>
<%@page import="com.sun.security.ntlm.Client"%>
<%@page import="java.util.List"%>
<%@page import="Datos.GuardarCliente"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Ver Reservas</title>
    </head>
    <body>


        <div class="row content">
            <div class="col-md-2 col-sm-2">
                <jsp:include page="menu.jsp" /> 
            </div>

            <div class="col-md-8 col-sm-8">
                <div class="container col-md-12">
                    <div class="col-md-9 col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3 class="  text-warning">Ver reservas</h3></div>
                            <div class="panel-body" style="min-height: 600px; max-height: 750px;overflow-y: scroll;">
                                <s:if test="dc_consumo_mensaje!=null">
                                    <div class="alert <s:property value="style"/> alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>¡<s:property value="estado"/>!</strong> <s:property value="dc_consumo_mensaje"/>.
                                    </div>
                                </s:if>                                
                                
                         
                                <s:if test="dc_consumo_lista!=null" >


                                    <h1>
                                        Reservas    
                                    </h1>
                                    <div class="table-responsive">

                                        <table class="table table-hover table-responsive table-bordered">
                                            <thead>
                                            <th>Placa</th>
                                            <th>Nombres</th>
                                            <th>Costo</th>
                                            <th>Sexo</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Fin</th>
                                            <th>Editar costo</th>

                                            </thead>
                                            <tbody id="tbody">
                                                <s:iterator value="dc_consumo_lista">
                                                    <tr>
                                                        <td><s:property value="placa"/></td>
                                                        <td><s:property value="costro"/></td>
                                                        <td><s:property value="nombres"/></td>
                                                        <td><s:property value="sexo"/></td>
                                                        <td><s:property value="fechainicio"/></td>
                                                        <td><s:property value="fechafin"/></td>   
                                                        <td>
                                                            <s:url action="editar" var="actualizar">
                                                                <s:param name="idreserva">
                                                                    <s:property value="idreserva"/>                                                                    
                                                                </s:param>
                                                            </s:url>
                                                            <s:a href="%{actualizar}" cssClass="btn btn-warning" data-toggle="tooltip" title="Editar costo"> 
                                                            <span class="glyphicon glyphicon-edit"></span>
                                                        </s:a></td>   
                                                    </tr>
                                                </s:iterator>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <h1>Auditoría</h1>
                                    <div class="table-responsive">

                                        <table class="table table-hover table-responsive table-bordered">
                                            <thead>
                                            <th>Usuario</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Valor viejo</th>
                                            <th>Valor nuevo</th>
                                            <th>Fecha Fin</th>                                            

                                            </thead>
                                            <tbody id="tbody">
                                                <s:iterator value="dc_consumo_listaA">
                                                    <tr>
                                                        <td><s:property value="usuario"/></td>
                                                        <td><s:property value="Fecha"/></td>
                                                        <td><s:property value="Hora"/></td>
                                                        <td><s:property value="v_viejo"/></td>
                                                        <td><s:property value="v_nuevo"/></td>
                                                      
                                                    </tr>
                                                </s:iterator>
                                            </tbody>
                                        </table>
                                    </div>
                                </s:if>       

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-2 sidenav">
                <div class="well">
                    <p>Nuestros vehículos</p>
                    <img src="images/v.png" class="img-thumbnail" />
                </div>
                <div class="well">   
                    <p>Calidad de motores</p>
                    <img src="images/v2.jpg" class="img-thumbnail" />                   
                </div>
            </div>        </div>

        <footer class="container-fluid text-center">
            <p>Footer Text</p>
        </footer>
        <script type="text/javascript" src="assets/jQuery/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js" ></script>        
        <script type="text/javascript" src="js/jquery.validate.min.js" ></script>    
        <script type="text/javascript" src="js/messages_es.js" ></script>   
        <script type="text/javascript" src="js/usuario.js">

        </script>
        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>

        <script >
          $(document).ready(function () {


          });
        </script>
    </body>
</html>

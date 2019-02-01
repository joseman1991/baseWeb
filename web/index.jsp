<%-- 
    Document   : registroUsuario
    Created on : 30-sep-2018, 20:55:10
    Author     : 
--%>
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
        <title>Registro de Cliente</title>
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
                            <div class="panel-heading"><h3 class="  text-warning">Registro de nuevo cliente</h3></div>
                            <div class="panel-body" style="min-height: 750; max-height: 750;overflow-y: scroll;">
                                <s:if test="dc_consumo_mensaje!=null">
                                    <div class="alert <s:property value="style"/> alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>¡<s:property value="estado"/>!</strong> <s:property value="dc_consumo_mensaje"/>.
                                    </div>
                                </s:if>                                
                                <form action="registrar" class="form-horizontal" method="post" id="formulario">






                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="nombre">Nombre *</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control required" name="nombres" maxlength="35" placeholder="Nombres"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="ciudad">Ciudad *</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control required" name="ciudad" maxlength="35" placeholder="Ciudad"/>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="Edad">Edad *</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control required" name="edad" placeholder="Edad"/>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="sexo">Sexo *</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="sexo">
                                                <option value="Femenino">Femenino</option>
                                                <option value="Masculino">Masculino</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="direccion">Email *</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control required" name="email" maxlength="100" placeholder="Email"/>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-4 pull-right"  >
                                        <input type="submit" class=" btn btn-info " value="Registrar" id="boton"/> <br>
                                        <small>(*) Campos Obligatiorios</small> <br>
                                    </div>
                                </form>

                                <br><br><br>
                                <h1>
                                 Lista de clientes    
                                </h1>
                                <div class="table-responsive">
                                    <table class="table table-hover table-responsive table-bordered">
                                        <thead>
                                        <th>Codigo</th>
                                        <th>Nombres</th>
                                        <th>Ciudad</th>
                                        <th>Edad</th>
                                        <th>Sexo</th>
                                        <th>Email</th>             

                                        </thead>
                                        <tbody id="tbody">
                                            <%
                                                GuardarCliente gu = new GuardarCliente();
                                                gu.obteLista();
                                                List<Cliente> lista = gu.getDc_consumo_lista();
                                                for (int idx = 0; idx < lista.size(); idx++) {
                                                    Cliente elem = lista.get(idx);
                                                    out.println("<tr>");
                                                    out.println("<td>");
                                                    out.println(elem.getIdCliente());
                                                    out.println("</td>");
                                                    
                                                    out.println("<td>");
                                                    out.println(elem.getNombres());
                                                    out.println("</td>");
                                                    
                                                    out.println("<td>");
                                                    out.println(elem.getCiudad());
                                                    out.println("</td>");
                                                    
                                                    out.println("<td>");
                                                    out.println(elem.getEdad());
                                                    out.println("</td>");
                                                    
                                                    out.println("<td>");
                                                    out.println(elem.getSexo());
                                                    out.println("</td>");
                                                    
                                                    out.println("<td>");
                                                    out.println(elem.getEmail());
                                                    out.println("</td>");                                                   
                                                    
                                                    out.println("</tr>");
                                                }

                                            %>

                                        </tbody>
                                    </table>
                                </div>



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
                $('.table').DataTable({
                    "language": {
                        "lengthMenu": "Mostrando _MENU_ registro por página",
                        "zeroRecords": "Lo sentimos - no hay resultados",
                        "info": "Mostrando página _PAGE_ de _PAGES_",
                        "infoEmpty": "No hay registros",
                        "infoFiltered": "(filtrado de _MAX_ registros totales)",
                        "paginate": {
                            "first": "Primero",
                            "last": "'Last'Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        },
                        "search": "Buscar"

                    }
                });
             
            });
        </script>
    </body>
</html>

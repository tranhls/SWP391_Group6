<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            .error {
                color: red;
                font-size: 14px;
            }
        </style>

    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger">
                                        <strong>Error!</strong> ${errorMessage}
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.productID}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${detail.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${detail.price}" name="price" id="price" type="text" class="form-control" required onblur="validatePrice('price', 'price-error');">
                                    <span id="price-error" class="error" style="display: none;"></span>
                                </div>

                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${detail.image}" name="image" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Current Category</label>
                                    <input value="${detail.category}" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Category you want to edit</label>
                                    <select name="Category" class="form-control">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.category}">${o.category}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script>
            function validateForm() {
                var isPriceValid = validatePrice('price', 'price-error');
                var isCatIDValid = validateCatID('catID', 'catID-error');


                return  isPriceValid && isCatIDValid && isCategoryValid;
            }
            function validatePrice(priceId, priceErrorId) {
                var price = document.getElementById(priceId).value;
                var regex = /^\d+(\.\d{1,2})?$/; // Regex để kiểm tra số nguyên hoặc số thập phân với tối đa hai chữ số sau dấu phẩy
                var errorElement = document.getElementById(priceErrorId);
                if (!regex.test(price)) {
                    errorElement.textContent = "Product price is invalid. Please enter a positive number, which can have a maximum of two digits after the decimal point.";
                    errorElement.style.display = "block";
                    return false;
                } else {
                    errorElement.style.display = "none";
                    return true;
                }
            }
            function validateCatID(catIDId, catIDErrorId) {
                var catID = document.getElementById(catIDId).value;
                if (isNaN(catID) || catID <= 0 || catID > 999999 || !Number.isInteger(Number(catID))) {
                    document.getElementById(catIDErrorId).textContent = "catID must be a positive integer, please choose from the existing catIDs.";
                    document.getElementById(catIDErrorId).style.display = "block";
                    return false;
                } else {
                    document.getElementById(catIDErrorId).style.display = "none";
                    return true;
                }
            }
        </script>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>

<cfscript>
  productService = createObject('lang_app.scripts.02-form-submission.ProductService').init();
  // writeDump(productService.queryActiveProducts());
</cfscript>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="./main.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <title>Products</title>

    <script src="main.js" type="text/javascript"></script>
  </head>

  <body>
    <div class="container">
      <p class="h3">Active Products</p>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Description</th>
            <th scope="col">GB</th>
            <th scope="col">Expiry</th>
            <th scope="col">300 Minutes</th>
            <th scope="col">VCT</th>
            <th scope="col">Price</th>
            <th scope="col">Active On</th>
          </tr>
        </thead>
        <tbody>
          <cfloop query="#productService.queryActiveProducts()#">
             <cfoutput>
              <tr>
                <th scope="row">#productId#</th>
                <td>#product_name#</td>
                <td>#partition_incl / 1024 / 1024 #</td>
                <td>#pplan_expiry# days</td>
                <td>#rp10#</td>
                <td>#voucher_type#</td>
                <td>#NumberFormat(amount, '$_.__')#</td>
                <td>#fkfeatures_name_enabled#</td>
              </tr>
           </cfoutput>
          </cfloop>
        </tbody>
      </table>
      <br />
      <br />

      <div class="table-title">
        <div class="row">
          <div class="col-sm-8"><h2>Employee <b>Details</b></h2></div>
          <div class="col-sm-4">
            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
          </div>
        </div>
      </div>
      <table class="table table-bordered table-form">
        <thead>
          <tr>
            <th>Name</th>
            <th>Department</th>
            <th>Phone</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>John Doe</td>
            <td>Administration</td>
            <td>(171) 555-2222</td>
            <td>
              <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
            </td>
          </tr>
          <tr>
            <td>Peter Parker</td>
            <td>Customer Service</td>
            <td>(313) 555-5735</td>
            <td>
              <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
            </td>
          </tr>
          <tr>
            <td>Fran Wilson</td>
            <td>Human Resources</td>
            <td>(503) 555-9931</td>
            <td>
              <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
              <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
              <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
            </td>
          </tr>
        </tbody>
      </table>

      <p class="h3">New Products</p>
      <form action="index_submit" method="post" accept-charset="uf-8">
        <div class="form-group">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Description</th>
                <th scope="col">GB</th>
                <th scope="col">300 Minutes</th>
                <th scope="col">VCT</th>
                <th scope="col">Price</th>
                <th scope="col">Active On</th>
                <th scope="col">GF On</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
          <div class="row">
            <div class="col-xs-6 form-group">
              <label for="productId">Product ID</label>
              <input type="text" class="form-control" id="productId" placeholder="Enter Product ID">
            </div>
            <div class="col-xs-6 form-group">
              <label for="productGb">GB</label>
              <input type="text" class="form-control" id="productGb" placeholder="Enter Product Size in GB">
            </div>
          </div>
        </div>
        <button type="button" class="btn btn-primary">Add</button>
      </form>
      <br/>
      <br/>
      <p class="h3">Active Features</p>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Start Active</th>
            <th scope="col">End Active</th>
          </tr>
        </thead>

        <tbody>
          <cfloop query="#productService.queryProductFeatures(activeOnly=true)#">
             <cfoutput>
              <tr>
                <th scope="row">#name#</th>
                <td>#active_from#</td>
                <td>#active_to#</td>
              </tr>
           </cfoutput>
          </cfloop>
        </tbody>
      </table>
      <br/>
      <br/>
      <p class="h3">All Features</p>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Start Active</th>
            <th scope="col">End Active</th>
          </tr>
        </thead>

        <tbody>
          <cfloop query="#productService.queryProductFeatures()#">
             <cfoutput>
              <tr>
                <th scope="row">#name#</th>
                <td>#active_from#</td>
                <td>#active_to#</td>
              </tr>
           </cfoutput>
          </cfloop>
        </tbody>
      </table>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>

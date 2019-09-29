<cfimport path="lang_app.scripts.02-form-submission.ProductService">
<cfimport path="lang_app.scripts.02-form-submission.criteria.*">

<cfset productService = "#new ProductService()#">

<cfif isDefined('session.baseId')>
  <cfset productService.addProductSet(session.baseId)>
  <cfloop from="1" to="#session.productCount#" index="i">
    <cfset productService.addProductLine(session["product#i#"])>
  </cfloop>
</cfif>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous">

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>

    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous">
    </script>

    <title>Products</title>

    <script src="main.js" type="text/javascript"></script>
  </head>

  <body>
    <div class="container">

      <cfinclude template="includes/uploadProducts.cfml">

      <hr/>


      <div class="accordion" id="accordionExample">

        <cfinclude template="includes/input.cfml">
        <cfinclude template="includes/new_product_plans.cfml">

        <div class="card">
          <div class="card-header" id="headingTwo">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                New Rate Plans
              </button>
            </h2>
          </div>
          <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generateRatePlans()#</cfoutput><br />
                <cfoutput>#productService.degenerateRatePlans()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>

        <cfinclude template="includes/matrix.cfml">

        <div class="card">
          <div class="card-header" id="heading3">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                Optus Mock (config/env/products.json)
              </button>
            </h2>
          </div>
          <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generateMockProductsJson()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="heading4">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                Optus Mock (config/_common/products/*.json)
              </button>
            </h2>
          </div>
          <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                TO copy from README.md
              </pre>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="heading5">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                Poseidon (app/models/product.rb)
              </button>
            </h2>
          </div>
          <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generatePoseidonJson()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="heading6">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                Services Views (src/libs/mobile/products.json)
              </button>
            </h2>
          </div>
          <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generateServicesViews()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="heading7">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
                Mobile API (config/product_catalog.json)
              </button>
            </h2>
          </div>
          <div id="collapse7" class="collapse" aria-labelledby="heading7" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generateMobileApiJson()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header" id="heading8">
            <h2 class="mb-0">
              <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
                Mobile API (config/products.yml)
              </button>
            </h2>
          </div>
          <div id="collapse8" class="collapse" aria-labelledby="heading8" data-parent="#accordionExample">
            <div class="card-body">
              <pre class="prettyprint">
                <cfoutput>#productService.generateMobileApiYaml()#</cfoutput><br />
              </pre>
            </div>
          </div>
        </div>
      </div>

      <hr />

      <p class="h3">In Market Products</p>
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
          <cfset baseRepo = new BaseRepository()>
          <cfset productsInMarket = new ProductsInMarket()>

          <cfloop query="#baseRepo.get(productsInMarket)#">
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

      <cfset featureRepo = new FeatureRepository()>
      <cfset productsActive = new FeatureProductsActive()>

<!--       <p class="h3">Active Features</p>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Start Active</th>
            <th scope="col">End Active</th>
          </tr>
        </thead>

        <tbody>
          <cfloop query="#featureRepo.get(productsActive)#">
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

          <cfset productsAll = new FeatureProductsAll()>

          <cfloop query="#featureRepo.get(productsAll)#">
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
 -->
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>

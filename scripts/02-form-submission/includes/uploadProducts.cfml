<form action="index_submit.cfml" method="post" accept-charset="utf-8" enctype="multipart/form-data">
  <p class="h3">New Products</p>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroupFileAddon01">Upload New Products Config</span>
    </div>
    <div class="custom-file">
      <input type="file" required class="custom-file-input" name="uploadFile" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
      <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
    </div>
  </div>

  <input class="btn btn-primary" type="submit" value="Submit">
</form>

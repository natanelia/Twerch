<%--<script>clearCategories()</script>--%>
<script>setDefaultCategories()</script>
<div class="container" style="padding-top:7%">
  <div class="row" style="padding:0 0 40px">
	<div class="col-md-12 text-center">
	  <img src="images/twerch.png">
	</div>
  </div>
	<form novalidate id="search-form" class="form" method="get">
		<!-- Search Query -->
	  <div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		  <div class="input-group input-group-lg">
			<input type="text" name="query" class="form-control" placeholder="Search files here...">
			<span class="input-group-btn">
			  <button class="btn btn-warning" id="search-form-submit" type="submit">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			  </button>
			</span>
		  </div>
		</div>
		<div class="col-md-3"></div>
	  </div>
		<!-- END OF Search Query -->
		<!-- Category Options -->
		<div class="row" style="margin-top:20px">
			<div class="col-md-12 text-center">
				<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseCategories" aria-expanded="false" aria-controls="collapseExample">
					Selected Categories:
					<span id="selected-category-names">
						<!-- PRINTED BY JQUERY -->
					</span> &nbsp;&nbsp;<span class="caret"></span>
				</button>
			</div>
		</div>
		<div class="collapse text-center" id="collapseCategories">
			<span id="category-list">
				<!-- PRINTED BY JQUERY -->
			</span>
			<button class="btn btn-info" id="add-new-category-button" type="button" style="margin-top:10px">Add New</button>
		</div>

		<!-- AlGORITHM -->
	  <div class="row" style="padding-top:20px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		  <div class="col-md-2"></div>
		  <div class="col-md-8 text-center">
			ALGORITHM
			<div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-default active">
				  <input type="radio" name="algorithm" id="KMP" value="KMP" checked> Knuth-Morris-Pratt
			  </label>
			  <label class="btn btn-default">
				  <input type="radio" name="algorithm" id="BM" value="BM"> Boyer-Moore
			  </label>
			</div>
		  </div>
		  <div class="col-md-2"></div>
		</div>
		<div class="col-md-3"></div>
	  </div>
	</form>
</div>
<%@ page import="models.Category" %>
<div class="container" style="padding-top:10%">
  <div class="row" style="padding:0 0 40px">
	<div class="col-md-12 text-center">
	  <img src="images/Logo-White.png" width=600 height=180>
	</div>
  </div>
	<form novalidate class="form" ng-submit="search_submit()">
	  <div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		  <div class="input-group input-group-lg">
			<input type="text" ng-model="search.query" class="form-control" placeholder="Search files here...">
			<span class="input-group-btn">
			  <button class="btn btn-warning" type="submit">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			  </button>
			</span>
		  </div>
		</div>
		<div class="col-md-3"></div>
	  </div>
	  <div class="row" style="padding-top:20px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		  <div class="col-md-2"></div>
		  <div class="col-md-8">
			  <div class="btn-group" data-toggle="buttons">
				  <% Category c = new Category(); %>
				  <% for (int i=0;i<c.getCategories().length;i++) { %>
				  <label class="btn btn-default <%if (i==0) System.out.print("active"); %>">
					  <a><%=c.getCategories()[i]%></a>
				  </label>
				  <%}%>
			  </div>
		  </div>
		  <div class="col-md-2"></div>
		</div>
		<div class="col-md-3"></div>
	  </div>
	  <div class="row" style="padding-top:20px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		  <div class="col-md-2"></div>
		  <div class="col-md-8 text-center">
			ALGORITHM
			<div class="btn-group" data-toggle="buttons">
			  <label class="btn btn-default active">
				  <input type="radio" name="algorithm" id="KMP" autocomplete="off" checked> Knuth-Morris-Pratt
			  </label>
			  <label class="btn btn-default">
				  <input type="radio" name="algorithm" id="BM" autocomplete="off" checked> Boyer-Moore
			  </label>
			</div>
		  </div>
		  <div class="col-md-2"></div>
		</div>
		<div class="col-md-3"></div>
	  </div>
	  <pre style="margin:20px">Search Debugging: {{search | json}}</pre>
	</form>
</div>
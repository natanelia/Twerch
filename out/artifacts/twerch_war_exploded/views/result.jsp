<%@ page import="crawler.twerchCrawler" %>
<%@ page import="models.CategoryKeywords" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.CategoryResult" %>
<%@ page import="models.TweetObject" %>
<div class="container">
	<form novalidate id="search-form" class="form" method="get">
		<div class="row" style="padding:20px">
			<div class="col-lg-2 col-md-2">
			  <a href="/"><img src="images/twerch.png" style="max-width:95%;height:auto;margin-top:-8px"></a>
			</div>
			<div class="col-lg-4 col-md-4">
				<div class="input-group">
					<input type="text" name="query" class="form-control" placeholder="Search files here...">
					<span class="input-group-btn">
					  <button class="btn btn-warning" id="search-form-submit" type="submit">
						  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					  </button>
					</span>
				</div>
			</div>
			<div class="col-lg-3 col-md-3">
				<div class="col-md-12 text-center">
					<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseCategories" aria-expanded="false" aria-controls="collapseExample">
						<span id="selected-category-names">
							<!-- PRINTED BY JQUERY -->
						</span> &nbsp;&nbsp;<span class="caret"></span>
					</button>
				</div>
			</div>
			<div class="col-lg-3 col-md-3">
				Algorithm:&nbsp;
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-default <%if (request.getParameter("algorithm").equals("KMP")) {%>active<%}%>">
						<input type="radio" name="algorithm" id="KMP" value="KMP" <%if (request.getParameter("algorithm").equals("KMP")) {%>checked<%}%>> KMP
					</label>
					<label class="btn btn-default <%if (request.getParameter("algorithm").equals("BM")) {%>active<%}%>">
						<input type="radio" name="algorithm" id="BM" value="BM" <%if (request.getParameter("algorithm").equals("BM")) {%>checked<%}%>> BM
					</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="collapse text-center" id="collapseCategories">
			<span id="category-list">
				<!-- PRINTED BY JQUERY -->
			</span>
				<button class="btn btn-info" id="add-new-category-button" type="button" style="margin-top:10px">Add New</button>
			</div>
		</div>
	</form>
	<%
		twerchCrawler tc = new twerchCrawler();
		List<CategoryKeywords> lck = new ArrayList<CategoryKeywords>();
		int i = 0;
		while (request.getParameter("cat-" + i) == null) {
			List<String> keywordList = new ArrayList<String>();
			String[] keywords = request.getParameter("cat-keywords-" + i).split(",");
			for (String keyword : keywords) {
				keywordList.add(keyword);
			}
			CategoryKeywords ck = new CategoryKeywords(request.getParameter("cat-" + i), keywordList);
			lck.add(ck);
		}
		List<CategoryResult> lcr = tc.getResult(request.getParameter("query"), lck, request.getParameter("algorithm"));
	%>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-6">
			<% for (CategoryResult cr : lcr) {%>
				<div class="row" id="category-title">
					<%=cr.getCategoryName()%>
					<%=cr.getCategoryName().length()%>
				</div>

				<% for (TweetObject to : cr.getTweets()) {%>
					<div class="row" id="item">
						<h3><b><%=to.getDisplayName()%></b></h3>
						<p><%=to.getTweetContent()%></p>
					</div>
				<% } %>
			<% } %>
		</div>
		<div class="col-md-5"></div>
	</div>
</div>

package edu.nju.desserthouse.action.hci;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.hci.SearchVO;
import edu.nju.desserthouse.service.SearchService;

public class SearchAction extends BaseAction{
	@Autowired
	private SearchService searchService;
	private String searchContent = "";
	
	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	@Override
	public String execute() throws Exception {
		SearchVO svo = searchService.getSearchResult(searchContent);
		request.setAttribute("svo",svo );
		return "search";
	}
	
}

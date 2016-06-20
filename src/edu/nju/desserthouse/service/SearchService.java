package edu.nju.desserthouse.service;

import edu.nju.desserthouse.model.hci.SearchVO;

public interface SearchService {

	public SearchVO getSearchResult(String searchContent);
}

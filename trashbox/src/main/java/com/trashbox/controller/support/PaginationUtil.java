package com.trashbox.controller.support;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.trashbox.exception.BusinessLogicException;
import com.trashbox.vo.PaginationInfo;

public class PaginationUtil {
	private static final Logger LOG = LogManager.getLogger(PaginationUtil.class);

	public static final int COMMENT_LIMIT = 10;
	public static final int ARTICLE_LIMIT = 15;

	public static PaginationInfo buildPaginationInfo(int currentPage, int total, int limit) throws Exception {

		/*
		 * currentPage = 사용자가 요청한 페이지 번호 
		 * startPage = 시작 페이지
		 * endPage = 마지막 페이지
		 * page = DB에 요청할 페이지 번호
		 */

		int startPage = 0;
		int endPage = 0;
		int page = 0;

		// totalPageNum 변수는 전체 페이지의 수
		int totalPageNum = total / limit + 1;
		
		LOG.debug(totalPageNum);
		
		// 요청한 값이 총 페이지 개수 보다 많거나 1보다 작을때  return null;
		if (currentPage > totalPageNum || currentPage < 1) {
			throw new BusinessLogicException("500", "요청한 값이 총 페이지 개수 보다 많거나 1보다 작음");

		}
		// 게시물이 딱 10개일 경우 다음페이지가 생기지 않게 -1 해줌
		if (total % limit == 0) {
			totalPageNum--;

		}

		if ((currentPage - 2) <= 1) {

			startPage = 1;

			if ((currentPage + 2) >= totalPageNum) {
				endPage = totalPageNum;
			} else {
				endPage = (currentPage + 4);
			}

		} else {
			startPage = (currentPage - 2);

			if ((currentPage + 2) >= totalPageNum) {
				startPage = (totalPageNum - 4) == 0 ? 1 : (totalPageNum - 4);
				endPage = totalPageNum;
			} else {
				endPage = (currentPage + 2);
			}
		}

		if (currentPage != -1) {

			if (!(currentPage == 1)) {
				// 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴

				int temp = (currentPage - 1) * limit;

				page = temp;

			} else if (currentPage == 1) {

				// 페이지 번호가 1이면 처음부터 15개
				page = 0;
			}

		}

		if (endPage > totalPageNum) {
			// 예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
			endPage = totalPageNum;

		}

		return new PaginationInfo(total, currentPage, totalPageNum, startPage, endPage, page);

	}
}

package org.petplanet.web.service.abandon;

import java.util.List;

import org.petplanet.web.domain.abandon.AbandonVO;
import org.petplanet.web.page.Pagination;

public interface AbandonService {
	List<AbandonVO> listAbandon(Pagination pagination);
}

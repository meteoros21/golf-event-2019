package net.ion.et.golfevent2019.repository;

import net.ion.et.golfevent2019.entity.GameInfo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public interface GameInfoRepository extends CrudRepository<GameInfo, String>
{
}

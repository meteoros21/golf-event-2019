package net.ion.et.golfevent2019.entity;

import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_game_info")
public class GameInfo
{
    @Id
    public String gameId;
    public String gameData;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getGameData() {
        return gameData;
    }

    public void setGameData(String gameData) {
        this.gameData = gameData;
    }
}

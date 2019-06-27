package net.ion.et.golfevent2019.controller;

import net.ion.et.golfevent2019.entity.GameInfo;
import net.ion.et.golfevent2019.repository.GameInfoRepository;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@RestController
public class ApiController
{
    @Autowired
    ServletContext servletContext;

    @Autowired
    GameInfoRepository gameInfoRepository;

    public static String gameData = null;

    @GetMapping("/api/getData")
    public String getData(@RequestParam("gameId") String gameId)
    {
        GameInfo gameInfo = gameInfoRepository.findById(gameId).orElse(null);

        if (gameInfo == null)
        {
            return "{\"dataList1\": null, \"dataList2\": null, \"finalRecord\": null, \"mvp\": null}";
        }
        else
        {
            return gameInfo.gameData;
        }

//        String jsonString = "";
//
//        jsonString = "{\"dataList1\": [" +
//                "{\"no\": 1, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 2, \"time\": \"10:00\", \"score\":\"\"}," +
//                "{\"no\": 2, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 2, \"time\": \"10:10\", \"score\":\"\"}," +
//                "{\"no\": 3, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 2, \"time\": \"10:20\", \"score\":\"\"}," +
//                "{\"no\": 4, \"player1\": \"Ahn Jae Seok\", \"point1\": \"86\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 2, \"time\": \"10:30\", \"score\":\"\"}," +
//                "{\"no\": 5, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 1, \"time\": \"10:40\", \"score\":\"\"}," +
//                "{\"no\": 6, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 1, \"time\": \"10:50\", \"score\":\"\"}," +
//                "{\"no\": 7, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 1, \"time\": \"11:00\", \"score\":\"\"}," +
//                "{\"no\": 8, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 1, \"time\": \"11:10\", \"score\":\"\"}," +
//                "{\"no\": 9, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 1, \"time\": \"11:20\", \"score\":\"\"}," +
//                "{\"no\": 10, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 1, \"time\": \"11:30\", \"score\":\"\"}," +
//                "{\"no\": 11, \"player1\": \"Kang David\", \"point1\": \"-\", \"player2\": \"Yu Yan\", \"point2\": \"-\", \"status\": 1, \"time\": \"11:40\", \"score\":\"\"}," +
//                "{\"no\": 12, \"player1\": \"Ahn Jeff\", \"point1\": \"-\", \"player2\": \"Chai Lung\", \"point2\": \"-\", \"status\": 0, \"time\": \"11:50\", \"score\":\"\"}" +
//                "]," +
//                "\"dataList2\": [" +
//                "{\"no\": 1, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 2, \"time\": \"10:00\", \"score\":\"\"}," +
//                "{\"no\": 2, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 2, \"time\": \"10:10\", \"score\":\"\"}," +
//                "{\"no\": 3, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 2, \"time\": \"10:20\", \"score\":\"\"}," +
//                "{\"no\": 4, \"player1\": \"Ahn Jae Seok\", \"point1\": \"86\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 2, \"time\": \"10:30\", \"score\":\"\"}," +
//                "{\"no\": 5, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 1, \"time\": \"10:40\", \"score\":\"\"}," +
//                "{\"no\": 6, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 1, \"time\": \"10:50\", \"score\":\"\"}," +
//                "{\"no\": 7, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 1, \"time\": \"11:00\", \"score\":\"\"}," +
//                "{\"no\": 8, \"player1\": \"Kang David\", \"point1\": \"81\", \"player2\": \"Yu Yan\", \"point2\": \"79\", \"status\": 1, \"time\": \"11:10\", \"score\":\"\"}," +
//                "{\"no\": 9, \"player1\": \"Ahn Jeff\", \"point1\": \"86\", \"player2\": \"Chai Lung\", \"point2\": \"85\", \"status\": 1, \"time\": \"11:20\", \"score\":\"\"}," +
//                "{\"no\": 10, \"player1\": \"Ahn Jae Seok\", \"point1\": \"78\", \"player2\": \"Zhi Ruo\", \"point2\": \"86\", \"status\": 1, \"time\": \"11:30\", \"score\":\"\"}," +
//                "{\"no\": 11, \"player1\": \"Kang David\", \"point1\": \"-\", \"player2\": \"Yu Yan\", \"point2\": \"-\", \"status\": 1, \"time\": \"11:40\", \"score\":\"\"}," +
//                "{\"no\": 12, \"player1\": \"Ahn Jeff\", \"point1\": \"-\", \"player2\": \"Chai Lung\", \"point2\": \"-\", \"status\": 0, \"time\": \"11:50\", \"score\":\"\"}" +
//                "]," +
//                "\"finalRecord\": [" +
//                "{\"point1\": 7.5, \"point2\": 4.5, \"winTeam\": 1}," +
//                "{\"point1\": 6.0, \"point2\": 7.1, \"winTeam\": 2}," +
//                "{\"point1\": 14.5, \"point2\": 11.6, \"winTeam\": 1}" +
//                "]," +
//                "\"mvp\": {" +
//                "\"teamNo\": 1," +
//                "\"teamName\": \"Korea Team\"," +
//                "\"player\": \"Ahn Jae Seock\",\"photoUrl\":\"/images/default-user.png\"" +
//                "\"records\": [" +
//                "    {\"point\": \"79\", \"rank\": \"WIN2\"}," +
//                "    {\"point\": \"6 & 3\", \"rank\": \"WIN2\"}" +
//                "]" +
//                "}" +
//                "}";
//
//        return jsonString;
    }

    @PostMapping("/api/setData")
    public Map<String,String> setData(@RequestParam("gameId") String gameId,
                                      @RequestParam("data") String data)
    {
        this.gameData = data;

        GameInfo gameInfo = new GameInfo();
        gameInfo.gameId = gameId;
        gameInfo.gameData = data;

        gameInfoRepository.save(gameInfo);

        HashMap<String, String> result = new HashMap<>();
        result.put("resultCode", "0");
        result.put("resultMsg", "Success");

        return result;
    }

    @GetMapping("/api/image/{fileName}")
    public byte[] getMvpImage(@PathVariable("fileName") String fileName) throws Exception
    {
        File file = new File("/app/golf-event-2019/uploaded/" + fileName);

        InputStream is = new FileInputStream(file);
        byte[] bytes = IOUtils.toByteArray(is);
        is.close();

        return bytes;
    }

    @PostMapping("/api/uploadPhoto")
    public Map<String,String> uploadPhoto(@RequestParam("photoFile")MultipartFile file) throws Exception
    {
        HashMap<String, String> result = new HashMap<>();
        result.put("resultCode", "0");
        result.put("resultMsg", "Success");

        String fileName = saveImageFile("/uploaded", file);

        if (fileName != null)
        {
            result.put("photo-url", "/api/image/" + fileName);
        }
        else
        {
            result.put("resultCode", "1");
            result.put("resultMsg", "Fail to uplaod file");
        }

        return result;
    }

    public String saveImageFile(String rootPath, MultipartFile imageFile)
    {
        try
        {
            // 디렉터리를 생성한다.
            String fileDir = "/app/golf-event-2019/uploaded";
            //String fileDir = servletContext.getRealPath(rootPath);
            File file = new File(fileDir);
            file.mkdirs();

            // 파일 이름과 파일 확장자를 얻는다.
            String fileExt = "";
            String fileNameOnly = "";
            String orgFileName = imageFile.getOriginalFilename();
            int pos = orgFileName.lastIndexOf(".");

            if (pos > 0)
            {
                fileExt = orgFileName.substring(pos + 1).toLowerCase();
                fileNameOnly = orgFileName.substring(0, pos);
            }

            String checkedFileName = orgFileName;

            // 동일한 이름이 있는지 확인한다.
            File fileTest = new File(fileDir + "/" + orgFileName);
            if (fileTest.exists())
            {
                int idx = 1;
                while (true)
                {
                    idx++;
                    String filePath = fileDir + "/" + fileNameOnly + "-" + idx + "." + fileExt;
                    File test = new File(filePath);

                    if (!test.exists())
                    {
                        checkedFileName = fileNameOnly + "-" + idx + "." + fileExt;
                        break;
                    }
                }
            }

            File file2 = new File(fileDir + "/" + checkedFileName);
            imageFile.transferTo(file2);

            return checkedFileName;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
}

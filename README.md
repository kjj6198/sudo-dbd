# sudo dbd
* [demo](http://sdbd.herokuapp.com/)
:watch:
為了解決公司內部訂餐問題而製作的app，主要是希望能夠讓訂餐流程簡化，訂餐者只要發起點餐就可以，由程式內部計算總額、截止時間等，節省大家的溝通成本。
### 目前進度

* 上版(已經完成主視覺　LOGO)
* 所有dbd的css全部在stylesheet/dbd 資料夾底下

### todo
* 所有前端頁面，放到 frontend controller 下處理
* 後台設定
* 動態倒數計時
* sudo會員認証
* ajax 

### refactor
* 用 select box 顯示餐廳資訊
* PG 在調整時間時會有錯誤 PG::DatatypeMismatch: ERROR:  column "start_time" cannot be cast automatically to type timestamp without time zone
HINT:  Specify a USING expression to perform the conversion.
: ALTER TABLE "menus" ALTER COLUMN "start_time"

* pipeline MD5 fingerprint 的問題尚未解決 (放在public?)


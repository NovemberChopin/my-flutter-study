// const serviceUrl = 'http://apis.juhe.cn/goodbook/';
const xuandanServiceUrl = 'http://api.xuandan.com/DataApi';
const jvheServiceUrl = 'http://apis.juhe.cn/goodbook';


const servicePath = {
  'homePageContext': xuandanServiceUrl + '/index',  // 首页数据
  'hotGoods': xuandanServiceUrl + '/GetGoodsPyq',    // 爆款商品
  'getDetailInfo': xuandanServiceUrl + '/GetGoodsPyq',
  
  'categoryList': jvheServiceUrl + '/catalog',      // 图书分类
};
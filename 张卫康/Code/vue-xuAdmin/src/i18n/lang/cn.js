/**
 * Created by WebStorm.
 * User: nirongxu
 * Date: 2018/12/8
 * Description: 文件描述
 */
import zhLocale from "element-ui/lib/locale/lang/zh-CN"
const cn = {
  routeName: {
    home: "主页",

    article: "答辩记录",
    publishArticle: "管理记录",
    publishArticleEditor: "管理记录-富文本",

    icon: "信息导入",
    builtInIcon: "信息导入",

    shuttleBox: "答辩队列",
    demoShuttle: "管理队列",

    permissions: "这是之前的权限管理",
    pageControl: "页面权限",
    btnControl: "按钮权限",

    table: "这是之前的表格",
    multiDataTable: "多选数据表格",
    filterTable: "筛选表格",
    dragSort: "拖拽排序",

    upload: "作品信息管理",
    fileUpload: "信息上传",

    editor: "评议管理",
    markdown: "教师评议",
    wangeditor: "wangeditor",

    multiDirectory: "结果和导出",
    "menu2-1": "二级-1",
    "menu2-2": "二级-2",
    "menu2-3": "二级-3",
    "menu3-1": "三级-1",
    "menu3-2": "三级-2",
    "menu3-3": "三级-3",
    "menu4-1": "四级-1",
    "menu4-2": "四级-2",
    "menu5-1": "五级-1",
    "menu5-2": "五级-2",

    systemSettings: "这是之前的系统设置",
    navMenu: "导航菜单"
  },
  rightMenu: {
    close: "关闭",
    closeOther: "关闭其他",
    closeAll: "全部关闭"
  },
  role: {
    superAdmin: "超级管理员",
    admin: "管理员",
    ordinary: "普通用户"
  },
  userDropdownMenu: {
    basicInfor: "基本资料",
    changePassword: "修改密码",
    logout: "退出"
  },

  ...zhLocale //  合并element-ui内置翻译
}

export default cn

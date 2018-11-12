import com.javaccy.core.persistence.JqGridPage;
import com.javaccy.core.security.shiro.annotation.ResMenu;
import com.javaccy.core.security.shiro.enums.MenuType;
import com.javaccy.core.utils.find.SearchForm;
import com.javaccy.web.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping(value = "/admin")
@ResMenu(name = "${entity.comment}管理",type = MenuType.MENU_LEFT,serial = "${entity.uncapitalizeName}Manager",parentSerial = "Sys")
public class ${entity.name}Controller extends WebUtils {


    @Autowired
    private ${entity.name}Service ${entity.uncapitalizeName}Service;

    /**
    * ${entity.comment}列表
    * @param request
    * @param page
    * @param model
    * @return ModelAndView
    */
    @ResMenu(name = "${entity.comment}管理",type = MenuType.MENU_LEFT,serial = "${entity.uncapitalizeName}List")
    @RequestMapping(value = "/${functions.underScoreCase(entity.uncapitalizeName)}/list",method = RequestMethod.GET)
    public ModelAndView ${entity.uncapitalizeName}List(HttpServletRequest request,Model model,JqGridPage page) {
        addSearchForm(new SearchForm(${entity.name}.class),model);
        page.setAutoPage(true);
        ${entity.uncapitalizeName}Service.selectJqGridPage(page);
        request.setAttribute("page", page);
        return new ModelAndView("${functions.properties("dir")}/${functions.underScoreCase(entity.uncapitalizeName)}/${functions.underScoreCase(entity.uncapitalizeName)}_list");
    }




    /**
    * 跳转到添加页面
    * @param model
    * @return
    */
    @ResMenu(name = "${entity.name}添加", type = MenuType.MENU_BUTTON, serial = "${entity.uncapitalizeName}Add")
    @RequestMapping(value = "/${entity.underScoreCaseName}/add",method = RequestMethod.GET)
    public ModelAndView ${entity.uncapitalizeName}Add(Model model){
        return new ModelAndView("${functions.properties("dir")}/${functions.underScoreCase(entity.uncapitalizeName)}/${functions.underScoreCase(entity.uncapitalizeName)}_edit");
    }

    /**
    * 添加${entity.comment}
    * @param ${entity.uncapitalizeName}
    * @return
    */
    @RequestMapping(value = "/${entity.underScoreCaseName}/add",method = RequestMethod.POST)
    public ModelAndView ${entity.uncapitalizeName}Add(${entity.name} ${entity.uncapitalizeName}){
        ${entity.uncapitalizeName}Service.insertSelective(${entity.uncapitalizeName});
        return new ModelAndView();
    }


    /**
    * 跳转到编辑页面
    * @param model
    * @param id
    * @return
    */
    @ResMenu(name = "${entity.comment}编辑", type = MenuType.MENU_BUTTON,serial = "${entity.uncapitalizeName}Edit")
    @RequestMapping(value = "/${entity.underScoreCaseName}/edit",method = RequestMethod.GET)
    public ModelAndView ${entity.uncapitalizeName}Edit(Model model,@RequestParam(required = false) String id){
        ${entity.name} ${entity.uncapitalizeName} = ${entity.uncapitalizeName}Service.selectById(id);
        model.addAttribute("o", ${entity.uncapitalizeName});
        return new ModelAndView("${functions.properties("dir")}/${functions.underScoreCase(entity.uncapitalizeName)}/${functions.underScoreCase(entity.uncapitalizeName)}_edit");
    }

    /**
    * 编辑${entity.comment}
    * @param ${entity.uncapitalizeName}
    * @return
    */
    @RequestMapping(value = "/${entity.underScoreCaseName}/edit",method = RequestMethod.POST)
    public ModelAndView ${entity.uncapitalizeName}Edit(${entity.name} ${entity.uncapitalizeName}){
        ${entity.uncapitalizeName}Service.updateSelective(${entity.uncapitalizeName});
        return new ModelAndView();
    }


    /**
    * 删除${entity.comment}
    * @param ids
    * @return
    */
    @ResMenu(name = "${entity.comment}删除",type = MenuType.MENU_BUTTON,serial = "${entity.uncapitalizeName}Delete")
    @RequestMapping(value = "/${entity.underScoreCaseName}/delete",method = RequestMethod.POST)
    public ModelAndView delete(String[] ids){
    ${entity.uncapitalizeName}Service.delInIds(ids);
        return new ModelAndView();
    }




}
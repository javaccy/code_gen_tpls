<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.yunxin.web.mapper.TbMiddleUserMapper">

    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="com.yunxin.web.domain.TbMiddleUser">
        <id column="emp_key" property="empKey" />
        <result column="hr_emp_id" property="hrEmpId" />
        <result column="name" property="name" />
        <result column="phone" property="phone" />
        <result column="sex" property="sex" />
        <result column="category_org_id" property="categoryOrgId" />
        <result column="peo_stf_class_cd" property="peoStfClassCd" />
        <result column="using_form_cd" property="usingFormCd" />
        <result column="enter_tm" property="enterTm" />
        <result column="adm_lvl_cd" property="admLvlCd" />
        <result column="emp_type_cd" property="empTypeCd" />
        <result column="dingd_user_id" property="dingdUserId" />
        <result column="workno" property="workno" />
        <result column="idnt_cert_id" property="idntCertId" />
        <result column="certificate_num" property="certificateNum" />
        <result column="certificate_type" property="certificateType" />
        <result column="syn_creat_time" property="synCreatTime" />
        <result column="syn_updata_time" property="synUpdataTime" />
        <result column="user_id" property="userId" />
    </resultMap>

    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
        emp_key, hr_emp_id, name, phone, sex, category_org_id, peo_stf_class_cd, using_form_cd, enter_tm, adm_lvl_cd, emp_type_cd, dingd_user_id, workno, idnt_cert_id, certificate_num, certificate_type, syn_creat_time, syn_updata_time, user_id
    </sql>

</mapper>

import "lang_app.scripts.02-form-submission.criteria.Criteria";

/**
 * [FeatureRepository description]
 */
component BaseRepository accessors="true" {

    property name="queryService" type="com.adobe.coldfusion.query";
    property name="dataSource" type="String" default="crm";

    /**
     * [init description]
     * @return {[type]} [description]
     */
    BaseRepository function init() {
        setQueryService(new query());
        setDataSource("crm");
        return this;
    }

    /**
     * [get description]
     * @criteria  {[type]} required Criteria      criteria [description]
     * @return {[type]}          [description]
     */
    Query function get(required Criteria criteria) {
        var dao = getQueryService();
        dao.setDatasource(getDataSource());

        dao.setSQL(criteria.getSql());

        return dao.execute().getResult();
    }
}

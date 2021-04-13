<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/4/1
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假信息统计</title>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
<div id="main" style="width:1000px;height:900px;margin: 0 auto;"></div>
<script src="echarts.min.js"></script>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    // 指定图表的配置项和数据
    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom, 'dark');
    var st1 = <%=session.getAttribute("st1")%>;
    var at1 = <%=session.getAttribute("at1")%>;
    var dt1 = <%=session.getAttribute("dt1")%>;
    var option;

    option = {

        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            left: 'center',
            top: 'bottom',
            data: ['at1', 'st1', 'dt1']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {
                    show: true
                },
                dataView: {
                    show: true,
                    readOnly: false
                },
                restore: {
                    show: true
                },
                saveAsImage: {
                    show: true
                }
            }
        },
        series: {
            name: '学生请假情况',
            type: 'pie',
            radius: [50, 300],

            roseType: 'area',
            itemStyle: {
                borderRadius: 5
            },
            data: [{
                value: at1,
                name: '已同意的'
            }, {
                value: st1,
                name: '未处理的'
            }, {
                value: dt1,
                name: '已拒绝的'
            }]
        }

    };

    option && myChart.setOption(option);
</script>
</body>
</html>

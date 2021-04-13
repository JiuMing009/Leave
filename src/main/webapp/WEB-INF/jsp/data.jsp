<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/3/16
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="js/echarts.min.js"></script>

</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom容器 -->
<div id="main" style="width: 1000px;height:800px;"></div>


</body>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        backgroundColor: '#555',
        textStyle: {
            color: 'rgba(255, 255, 255, 1)'
        },
        series: [{
            name: '哈哈哈',
            type: 'pie',
            radius: '70%',
            data: [{
                value: 400,
                name: '小江'
            }, {
                value: 335,
                name: '小明'
            }, {
                value: 310,
                name: '小杰'
            }, {
                value: 274,
                name: '么么'
            }, {
                value: 235,
                name: '阿杰'
            }],
            roseType: 'angle',

            itemStyle: {
                emphasis: {
                    shadowBlur: 200,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            label: {
                normal: {
                    textStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    }
                }
            },
            labelLine: {
                normal: {
                    lineStyle: {
                        color: 'rgba(255, 255, 255, 0.3)'
                    }
                }
            }

        }]
    }
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

</html>
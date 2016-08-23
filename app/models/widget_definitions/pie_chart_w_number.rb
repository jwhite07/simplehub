class WidgetDefinition
  class RingPieChartWNumber
    def self.addToDB
      WidgetDefinition.create(
      {name: 'Ring Pie Chart w/Number', 
        chart_settings: {
          "background-color"        => "#F4F4F4",
          "title"                   => "",
          "title-color"             => "#626262",
          "plot-background-color"   => "#FFFFFF",
          "plot-border-color"       => "#DFE1E3",
          "label-text"              => "",
          "tooltip-text"            => ""
        },
        data_settings: {
          "data-type"   => "Int-Single",
          "text"        => "",
          "background"  => "#FF0000"
        },
        template:  "{
                'type':'pie',
                'background-color':'{{background-color}}',
                'legend':{
                    'background-color':'none',
                    'border-width':0,
                    'shadow':false,
                    'layout':'float',
                    'margin':'auto auto 16% auto',
                    'marker':{
                        'border-radius':3,
                        'border-width':0
                    },
                    'item':{
                        'color':'%backgroundcolor'
                    }
                },
                'title':{
                    'text':'{{title}}',
                    'background-color':'none',
                    'font-size':16,
                    'color':'{{title-color}}',
                    'x':0,
                    'y':80
                },
                'plotarea':{
                    'background-color':'{{plot-background-color}}',
                    'border-color':'{{plot-border-color}}',
                    'border-width':1,
                    'border-radius':3,
                    'margin':'15% 5%'
                },
                'labels':[
                    {
                        'x':'45%',
                        'y':'47%',
                        'width':'10%',
                        'text':'{{label-text}}',
                        'font-size':24
                    }    
                ],
                'plot':{
                    'size':100,
                    'slice':70,
                    'margin-right':100,
                    'border-width':0,
                    'shadow':0,
                    'value-box':{
                        'visible':false
                    },
                    'tooltip':{
                        'text':'%v {{tooltip-text}}',
                        'shadow':false,
                        'border-radius':3
                    }
                },
                'series':[
                    {% for instance in data.series %}
    					{
    	                    'values':[{{instance.value}}],
    	                    'text':'{{instance.text}}',
    	                    'background-color':'{{instance.color}}'
    	                }
    					{% if forloop.last == false %},{% endif %}
    				{% endfor %}
                ]
            }"
    
          })
    end
  end
end
        
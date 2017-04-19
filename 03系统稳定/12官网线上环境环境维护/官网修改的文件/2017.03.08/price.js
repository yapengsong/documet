    $(document).ready(function(e) {
        var price = new EayunPrice();
        function FormData (_data) {
            var dataEch = _data || {
                dataCenter: 'bj',
                purchaseMessage:'bnby',
                publicNet: false,
                image: 'widowsStandard2012',
                mem: 'mem11',
                purchase: 'monthly',
                month: 1,
                number: 1,
                product: 'ech',
                progressInput: 'input',
            };

            var dataEcd = _data || {
                dataCenter: 'bj',
                purchaseMessage:'bnby',
                cloudType: true,
                capacity: 1,
                purchase: 'monthly',
                month: 1,
                number: 1,
                product: 'ecd',
                progressInput: 'input'
            };

            var dataSna = _data || {
                dataCenter: 'bj',
                snapshot: 1,
                purchase: 'needed',
                number: 1,
                product: 'sna',
                progressInput: 'input'
            };

            var dataVpc = _data || {
                dataCenter: 'bj',
                purchaseMessage:'bnby',
                bandwidth: 1,
                purchase: 'monthly',
                month: 1,
                number: 1,
                product: 'vpc',
                progressInput: 'input'
            };

            var dataEip = _data || {
                dataCenter: 'bj',
                purchaseMessage:'bnby',
                purchase: 'monthly',
                month: 1,
                number: 1,
                product: 'eip',
                progressInput: 'input'
            };

            var dataEos = _data || {
                dataCenter: 'bj',
                space: 1,
                spaceSelect: 'GB',
                flow: 1,
                flowSelect: 'GB',
                request: 1,
                download: 0,
                downloadSelect: 'GB',
                purchase: 'eos',
                product: 'eos'
            };

            dataEch.id = new Date().getTime();
            dataEcd.id = new Date().getTime();
            dataSna.id = new Date().getTime();
            dataVpc.id = new Date().getTime();
            dataEip.id = new Date().getTime();
            dataEos.id = new Date().getTime();

            this.getDataEch = function () {
                return dataEch;
            }

            this.getDataEcd = function () {
                return dataEcd;
            }

            this.getDataSna = function () {
                return dataSna;
            }

            this.getDataVpc = function () {
                return dataVpc;
            }

            this.getDataEip = function () {
                return dataEip;
            }

            this.getDataEos = function () {
                return dataEos;
            }
        }

        function total(){
            var total = 0;
            for(i=0;i<$(".jiage_view_content").length;i++){
                var strLength = $(".jiage_view_content").eq(i).find(".edit_sum").text().length;
                total += parseFloat($(".jiage_view_content").eq(i).find(".edit_sum").text().substr(1, strLength));
            }
            $(".total_price").html(total.toFixed(3));
        };

        FormData.prototype.attrEch = function (attr,value) {
            var data = this.getDataEch();
            if(value === undefined){
                return data[attr];

            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            } 
        };

        FormData.prototype.attrEcd = function (attr,value) {
            var data = this.getDataEcd();
            if(value === undefined){
                return data[attr];
            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            } 
        };

        FormData.prototype.attrSna = function (attr,value) {
            var data = this.getDataSna();

            if(value === undefined){
                return data[attr];
            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            }
        };

        FormData.prototype.attrVpc = function (attr,value) {
            var data = this.getDataVpc();

            if(value === undefined){
                return data[attr];
            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            }
        };

        FormData.prototype.attrEip = function (attr,value) {
            var data = this.getDataEip();

            if(value === undefined){
                return data[attr];
            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            }
        };

        FormData.prototype.attrEos = function (attr,value) {
            var data = this.getDataEos();

            if(value === undefined){
                return data[attr];
            }else{
                if(data.hasOwnProperty(attr)){
                    data[attr] = value;
                    if($(".jiage_top_title .biaoti1").html()=="云主机"){
                        $('.sum').text(this.getPrice());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                        $('.sum').text(this.getPriceEcd());
                    }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                        $('.sum').text(this.getPriceSna());
                    }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                        $('.sum').text(this.getPriceVpc());
                    }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                        $('.sum').text(this.getPriceEip());
                    }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                        $('.sum').text(this.getPriceEos());
                    }
                }
            }
        };

        FormData.prototype.getPrice = function(argument){
            var data = this.getDataEch(),preview = price.getPrice(data);
            preview = data.purchase == 'monthly' ? preview * data.month : preview;
            return (preview*data.number).toFixed(3);
        };

        FormData.prototype.getPriceEcd = function(argument){
            var data = this.getDataEcd(),preview = price.getPriceEcd(data);
            preview = data.purchase == 'monthly' ? preview * data.month : preview;
            return (preview*data.number).toFixed(3);
        };

        FormData.prototype.getPriceSna = function(argument){
            var data = this.getDataSna(),preview = price.getPriceSna(data);
            return (preview*data.number).toFixed(3);
        };

        FormData.prototype.getPriceVpc = function(argument){
            var data = this.getDataVpc(),preview = price.getPriceVpc(data);
            preview = data.purchase == 'monthly' ? preview * data.month : preview;
            return (preview*data.number).toFixed(3);   
        };

        FormData.prototype.getPriceEip = function(argument){
            var data = this.getDataEip(),preview = price.getPriceEip(data);
            preview = data.purchase == 'monthly' ? preview * data.month : preview;
            return (preview*data.number).toFixed(3); 
        };

        FormData.prototype.getPriceEos = function(argument){
            var data = this.getDataEos(),preview = price.getPriceEos(data);
            return (preview).toFixed(3); 
        };

        FormData.prototype.createViewEch = function(){
            var template = '<ul class="jiage_view_content">'+
                            '<p><label class="current_product">云主机</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                            '<li class="edit_data"></li>'+
                            '<li class="edit_net"></li>'+
                            '<li class="edit_system"></li>'+
                            '<li class="edit_host"></li>'+
                            '<li class="edit_buy_message"></li>'+
                            '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                            '</ul>';
            var view = $(template),data = this.getDataEch();
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPrice());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_net').text('公网IP：'+ (data.publicNet?'已购买':'未购买'));
            view.find('.edit_system').text('镜像：'+ price.getImageByCode(data.image).name);
            view.find('.edit_host').text('主机规格：'+ price.getMemByCode(data.mem).type + '核' + price.getMemByCode(data.mem).name + 'GB');
            view.find('.edit_buy_message').text((data.purchase == 'monthly' ? data.month +'个月': '1小时' ) + 'x'+ data.number + '台');
            return view;  
        };

        FormData.prototype.createViewEcd = function(){
            var template = '<ul class="jiage_view_content">'+
                        '<p><label  class="current_product">云硬盘</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                        '<li class="edit_data"></li>'+
                        '<li class="edit_type"></li>'+
                        '<li class="edit_capacity"></li>'+
                        '<li class="edit_buy_message"></li>'+
                        '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                    '</ul>';
            var view = $(template),data = this.getDataEcd();            
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPriceEcd());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_type').text('类型：普通云硬盘');
            view.find('.edit_capacity').text('容量：'+ data.capacity + 'GB');
            view.find('.edit_buy_message').text((data.purchase == 'monthly' ? data.month +'个月': '1小时' ) + 'x'+ data.number + '块');
            return view; 
        };

        FormData.prototype.createViewSna = function(){
            var template = '<ul class="jiage_view_content">'+
                            '<p><label  class="current_product">云硬盘快照</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                            '<li class="edit_data"></li>'+
                            '<li class="edit_snapshot"></li>'+
                            '<li class="edit_buy_message"></li>'+
                            '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                        '</ul>';
            var view = $(template),data = this.getDataSna();
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPriceSna());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_snapshot').text('容量：'+ data.snapshot + 'GB');
            view.find('.edit_buy_message').text('1个小时 x'+ data.number + '个');
            return view;
        };

        FormData.prototype.createViewVpc = function(){
            var template = '<ul class="jiage_view_content">'+
                            '<p><label  class="current_product">私有网络</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                            '<li class="edit_data"></li>'+
                            '<li class="edit_bandwidth"></li>'+
                            '<li class="edit_buy_message"></li>'+
                            '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                        '</ul>';
            var view = $(template),data = this.getDataVpc();
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPriceVpc());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_bandwidth').text('带宽：'+ data.bandwidth + 'Mbps');
            view.find('.edit_buy_message').text((data.purchase == 'monthly' ? data.month +'个月': '1小时' ) + 'x'+ data.number + '个');
            return view;
        };

        FormData.prototype.createViewEip = function(){
            var template = '<ul class="jiage_view_content">'+
                            '<p><label  class="current_product">弹性公网IP</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                            '<li class="edit_data"></li>'+
                            '<li class="edit_buy_message"></li>'+
                            '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                        '</ul>';
            var view = $(template),data = this.getDataEip();
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPriceEip());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_buy_message').text((data.purchase == 'monthly' ? data.month +'个月': '1小时' ) + 'x'+ data.number + '个');
            return view;
        };

        FormData.prototype.createViewEos = function(){
            var template = '<ul class="jiage_view_content">'+
                            '<p><label  class="current_product">对象存储</label><span class="edit_sum"></span><div class="clear"></div></p>'+
                            '<li class="edit_data"></li>'+
                            '<li class="edit_space"></li>'+
                            '<li class="edit_flow"></li>'+
                            '<li class="edit_request"></li>'+
                            '<li class="edit_download"></li>'+
                            '<li class="edit_days"></li>'+
                            '<li class="jiage_edit"><span class="edit"></span><span class="delete"></span></li>'+
                        '</ul>';
            var view = $(template),data = this.getDataEos();
            view.attr('id','id'+data.id);
            view.find('.edit_sum').text('￥'+ this.getPriceEos());
            view.find('.edit_data').text('数据中心：'+ price.getDataCenterByCode(data.dataCenter).name);
            view.find('.edit_space').text('存储空间/月：'+ data.space + data.spaceSelect);
            view.find('.edit_flow').text('下行流量/月：'+ data.flow + data.flowSelect);
            view.find('.edit_request').text('请求次数/月：'+ data.request + '万次');
            view.find('.edit_download').text('CDN下载流量/月：'+ data.download + data.downloadSelect);
            return view;
        };

        FormData.prototype.renderFormEch = function(){
            var data = this.getDataEch(),that = this;
            function createSystem (dataCenterCode) {
                var os = price.getOSByDataCenterCode(dataCenterCode),
                    system = $('.system'),
                    image = price.getImageByCode(data.image);
                system.empty();
                $.each(os,function (index,element) {
                    var span = $('<span></span>');
                    span.addClass(element.type);
                    span.click(function () {
                        system.find('.active').removeClass('active');
                        span.addClass('active');
                        createSystemSelect(element.image);
                    });
                    system.append(span);
                    if(image.type == element.type){
                        span.click();
                    }
                });
            };

            function createSystemSelect (images) {
                var systemSelect = $('.system_select ul');
                systemSelect.empty();
                $.each(images,function (index,element) {
                    var li = $('<li></li>');
                    li.text(element.name);
                    li.attr('data-code',element.code);
                    li.click(function () {
                        systemSelect.find('.current').removeClass('current');
                        li.addClass('current');
                        that.attrEch('image',element.code);
                    });
                    systemSelect.append(li);
                    if(data.image == element.code){
                        li.click();
                    }
                });
                if(systemSelect.find('.current').length == 0){
                    systemSelect.find('li').first().click();
                }
            };

            function createCpu (dataCenterCode) {
                var cpu = price.getCpuByDataCenterCode(dataCenterCode),
                    cpuStorage = $('.cpu'),
                    mem = price.getMemByCode(data.mem);
                cpuStorage.find('.jiage_mark').remove();
                $.each(cpu,function (index,element) {
                    var span = $('<span  class="jiage_mark"></span>');
                        span.text(element.type+'核');
                    span.click(function () {
                        cpuStorage.find('.current').removeClass('current');
                        span.addClass('current');
                        createMem(element.mem);
                    });
                    cpuStorage.append(span);
                    if(mem.type == element.type){
                        span.click();
                    }
                });

                if(cpuStorage.find('.current').length == 0){
                    cpuStorage.find('.jiage_mark').first().click();
                }
            };

            function createMem (mems) {
                var storage = $('.storage');
                storage.find('.jiage_mark').remove();

                $.each(mems,function (index,element) {
                    var span = $('<span  class="jiage_mark"></span>');
                    span.text(element.name +'GB');
                    span.attr('data-code',element.code);
                    span.click(function () {
                        storage.find('.current').removeClass('current');
                        span.addClass('current');
                        that.attrEch('mem',element.code);
                    });
                    storage.append(span);
                    if(data.mem == element.code){
                        span.click();
                    }
                });

                if(storage.find('.current').length == 0){
                    storage.find('.jiage_mark').first().click();
                }
            };

            var dataCenterDom = $('.data_centerEch'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrEch('dataCenter',element.code);
                    createSystem(element.code);
                    createCpu(element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });


            $('.system_select li').click(function(){
                if($(this).text()=='Windows sever2008 R2 标准版 64位中文版'){
                    $('.cpu span:last').hide();
                    if($('.storage span:last').text()=='64GB'){
                        $('.storage span:last').hide();
                    }
                    $('.cpu span').click(function(){
                        if($(this).text()=='16核'){
                           $('.storage span:last').hide();
                        }
                    })
                }else{
                    $('.cpu span:last').show();
                    $('.storage span:last').show(); 
                }
            });

            if(that.attrEch('publicNet')){
                $('.public_net').attr('checked','checked');
            }else{
                $('.public_net').removeAttr('checked','checked'); 
            }

            $('#purchase_number input').val(that.attrEch('number'));


            /*进度条*/
            var progress = $('#progressEch').progress({
                totalStep: 14,
                format:function(step){
                    if(step<12){
                        return step;
                    }else{
                        return ((step - 11)*12).toFixed(0);
                    }
                },
                parse:function(value){
                    if(value<12){
                        return value;
                    }else{
                        return value/12 + 11;
                    }
                },
                onChange: function(){
                    $('#progressTextEch').val(progress.getValue());
                    that.attrEch('month',progress.getValue());
                }
            });
            progress.setValue(that.attrEch('month'));

            var progressDom = $('.progressEch'),
                progressInput = price.getProgressInput();
            progressDom.find('#progressTextEch').remove();

            $.each(progressInput,function(index, element) {
                var input = $('<input class="time" type="text" id="progressTextEch" />');
                input.attr('value',data.month);
                input.blur(function () {
                    progress.setValue(parseInt($('#progressTextEch').val()));
                });
                progressDom.append(input);
            });
        };

        FormData.prototype.renderFormEcd = function(){
            var data = this.getDataEcd(),that = this;

            var dataCenterDom = $('.data_centerEcd'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrEcd('dataCenter',element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });

            $('#purchase_number input').val(that.attrEcd('number'));

            /*进度条*/
            var progress = $('#progressEcd').progress({
                totalStep: 14,
                format:function(step){
                    if(step<12){
                        return step;
                    }else{
                        return ((step - 11)*12).toFixed(0);
                    }
                },
                parse:function(value){
                    if(value<12){
                        return value;
                    }else{
                        return value/12 + 11;
                    }
                },
                onChange: function(){
                    $('#progressTextEcd').val(progress.getValue());
                    that.attrEcd('month',progress.getValue());
                }
            });
            progress.setValue(that.attrEcd('month'));

            var progressDom = $('.progressEcd'),
                progressInput = price.getProgressInput();
            progressDom.find('#progressTextEcd').remove();

            $.each(progressInput,function(index, element) {
                var input = $('<input class="time" type="text" id="progressTextEcd" />');
                input.attr('value',data.month);
                input.blur(function () {
                    progress.setValue(parseInt($('#progressTextEcd').val()));
                });
                progressDom.append(input);
            });

            var progressCapacity = $('#progressCapacityEcd').progress({
                 totalStep: 2048,
                 format:function(step){
                         return (step).toFixed(0);
                 },
                 parse:function(value){
                         return value;
                 },
                 onChange: function(){
                     $('#progressTextCapacityEcd').val(progressCapacity.getValue());
                     that.attrEcd('capacity',progressCapacity.getValue());
                 }
            });
            progressCapacity.setValue(that.attrEcd('capacity'));

            var progressCapacityDom = $('.progressCapacityEcd'),
                progressCapacityInput = price.getProgressInput();
            progressCapacityDom.find('#progressTextCapacityEcd').remove();

            $.each(progressCapacityInput,function(index, element) {
                var input = $('<input class="capacity" type="text" id="progressTextCapacityEcd" />');
                input.attr('value',data.capacity);
                input.blur(function () {
                    progressCapacity.setValue(parseInt($('#progressTextCapacityEcd').val()));
                });
                progressCapacityDom.append(input);
            });
        };

        FormData.prototype.renderFormSna = function(){
            var data = this.getDataSna(),that = this;

            var dataCenterDom = $('.data_centerSna'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrSna('dataCenter',element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });


            $('#purchase_number input').val(that.attrSna('number'));


            var progressCapacity = $('#progressCapacitySna').progress({
                totalStep: 2048,
                format:function(step){
                        return (step).toFixed(0);
                },
                parse:function(value){
                        return value;
                },

                onChange: function(){
                    $('#progressTextCapacitySna').val(progressCapacity.getValue());
                    that.attrSna('snapshot',progressCapacity.getValue());
                }
            });
            progressCapacity.setValue(that.attrSna('snapshot'));

            var progressCapacityDom = $('.progressCapacitySna'),
                progressCapacityInput = price.getProgressInput();
            progressCapacityDom.find('#progressTextCapacitySna').remove();

            $.each(progressCapacityInput,function(index, element) {
                var input = $('<input class="capacity" type="text" id="progressTextCapacitySna" />');
                input.attr('value',data.snapshot);
                input.blur(function () {
                    progressCapacity.setValue(parseInt($('#progressTextCapacitySna').val()));
                });
                progressCapacityDom.append(input);
            });
        };


        FormData.prototype.renderFormVpc = function(){
            var data = this.getDataVpc(),that = this;

            var dataCenterDom = $('.data_centerVpc'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrVpc('dataCenter',element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });

            $('#purchase_number input').val(that.attrVpc('number'));

            /*进度条*/
            var progress = $('#progressVpc').progress({
                totalStep: 14,
                format:function(step){
                    if(step<12){
                        return step;
                    }else{
                        return ((step - 11)*12).toFixed(0);
                    }
                },
                parse:function(value){
                    if(value<12){
                        return value;
                    }else{
                        return value/12 + 11;
                    }
                },
                onChange: function(){
                    $('#progressTextVpc').val(progress.getValue());
                    that.attrVpc('month',progress.getValue());
                }
            });
            progress.setValue(that.attrVpc('month'));

            var progressDom = $('.progressVpc'),
                progressInput = price.getProgressInput();
            progressDom.find('#progressTextVpc').remove();

            $.each(progressInput,function(index, element) {
                var input = $('<input class="time" type="text" id="progressTextVpc" />');
                input.attr('value',data.month);
                input.blur(function () {
                    progress.setValue(parseInt($('#progressTextVpc').val()));
                });
                progressDom.append(input);
            });


            var progressCapacity = $('#progressCapacityVpc').progress({
                totalStep: 100,
                format:function(step){
                        return (step).toFixed(0);
                },
                parse:function(value){
                        return value;
                },

                onChange: function(){
                    $('#progressTextCapacityVpc').val(progressCapacity.getValue());
                    that.attrVpc('bandwidth',progressCapacity.getValue());
                }
            });
            progressCapacity.setValue(that.attrVpc('bandwidth'));

            var progressCapacityDom = $('.progressCapacityVpc'),
                progressCapacityInput = price.getProgressInput();
            progressCapacityDom.find('#progressTextCapacityVpc').remove();

            $.each(progressCapacityInput,function(index, element) {
                var input = $('<input class="capacity" type="text" id="progressTextCapacityVpc" />');
                input.attr('value',data.bandwidth);
                input.blur(function () {
                    progressCapacity.setValue(parseInt($('#progressTextCapacityVpc').val()));
                });
                progressCapacityDom.append(input);
            });
        };

        FormData.prototype.renderFormEip = function(){
            var data = this.getDataEip(),that = this;

            var dataCenterDom = $('.data_centerEip'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrEip('dataCenter',element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });


            $('#purchase_number input').val(that.attrEip('number'));

            /*进度条*/
            var progress = $('#progressEip').progress({
                totalStep: 14,
                format:function(step){
                    if(step<12){
                        return step;
                    }else{
                        return ((step - 11)*12).toFixed(0);
                    }
                },
                parse:function(value){
                    if(value<12){
                        return value;
                    }else{
                        return value/12 + 11;
                    }
                },
                onChange: function(){
                    $('#progressTextEip').val(progress.getValue());
                    that.attrEip('month',progress.getValue());
                }
            });
            progress.setValue(that.attrEip('month'));

            var progressDom = $('.progressEip'),
                progressInput = price.getProgressInput();
            progressDom.find('#progressTextEip').remove();

            $.each(progressInput,function(index, element) {
                var input = $('<input class="time" type="text" id="progressTextEip" />');
                input.attr('value',data.month);
                input.blur(function () {
                    progress.setValue(parseInt($('#progressTextEip').val()));
                });
                progressDom.append(input);
            });
        };

        FormData.prototype.renderFormEos = function(){
            var data = this.getDataEos(),that = this;

            var dataCenterDom = $('.data_centerEos'),
                dataCenter = price.getDataCenter();
            dataCenterDom.find('.jiage_mark').remove();
            $.each(dataCenter,function(index, element) {
                var span = $('<span class="jiage_mark"></span>');
                span.text(element.name);
                span.attr('data-code',element.code);
                span.click(function () {
                    dataCenterDom.find('.current').removeClass('current');
                    span.addClass('current');
                    that.attrEos('dataCenter',element.code);
                });
                dataCenterDom.append(span);
                if(element.code == data.dataCenter){
                    span.click();
                }
            });


            $('.space').val(that.attrEos('space'));
            $('.spaceSelect').val(that.attrEos('spaceSelect'));
            $('.flow').val(that.attrEos('flow'));
            $('.flowSelect').val(that.attrEos('flowSelect'));
            $('.request').val(that.attrEos('request'));
            $('.download').val(that.attrEos('download'));
            $('.downloadSelect').val(that.attrEos('downloadSelect'));
        };

        $('.public_net').click(function(){
            dataEch.attrEch('publicNet',$(this).is(':checked'));
        });

        $('#purchase_number .reduce').click(function(){
            var number = parseInt($('#purchase_number input').val());
            number = number < 2 ? number : --number;
            $('#purchase_number input').val(number);
            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch.attrEch('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd.attrEcd('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataSna.attrSna('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc.attrVpc('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip.attrEip('number',number);
            }
        });


        $('#purchase_number .plus').click(function(){
            var number = parseInt($('#purchase_number input').val());
            number = number > 99 ? number : ++number;

            $('#purchase_number input').val(number);
            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch.attrEch('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd.attrEcd('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataSna.attrSna('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc.attrVpc('number',number);
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip.attrEip('number',number);
            }
        });

        $('#purchase_number input').blur(function(){
            
            if (parseInt($(this).val())>100){
                $(this).val(100);
            }

            if (parseInt($(this).val())==0){
                $(this).val(0);
            }

            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch.attrEch('number',parseInt($(this).val()));
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd.attrEcd('number',parseInt($(this).val()));
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataSna.attrSna('number',parseInt($(this).val()));
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc.attrVpc('number',parseInt($(this).val()));
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip.attrEip('number',parseInt($(this).val()));
            }
        });

        $("input").keyup(function(e) {
            this.value=this.value.replace(/[^\d]/g,'');
            if ($(this).val()==''){
                $(this).val(0);
            }
        });
        

        $('.space').blur(function(){
            $(this).val(parseInt($(this).val()));
            dataEos.attrEos('space',parseInt($(this).val()));
        });

        $('.spaceSelect').change(function() {
            if($(this).val() == 'TB'){
                if (parseInt($('.space').val())>10000000){
                    $('.space').val(10000000);
                    dataEos.attrEos('space',$('.space').val());
                }
            }
            dataEos.attrEos('spaceSelect',$(this).val());
        });

        $('.flow').blur(function(){
            $(this).val(parseInt($(this).val()));
            dataEos.attrEos('flow',parseInt($(this).val()));
        });

        $('.flowSelect').change(function() {
            if($(this).val() == 'TB'){
                if (parseInt($('.flow').val())>10000000){
                    $('.flow').val(10000000);
                    dataEos.attrEos('flow',$('.flow').val());
                }
            }
            dataEos.attrEos('flowSelect',$(this).val());
        });

        $('.request').blur(function(){
            $(this).val(parseInt($(this).val()));
            dataEos.attrEos('request',parseInt($(this).val()));
        });

        $('.download').blur(function(){
            $(this).val(parseInt($(this).val()));
            dataEos.attrEos('download',parseInt($(this).val()));
        });
        $('.downloadSelect').change(function() {
            if($(this).val() == 'TB'){
                if (parseInt($('.download').val())>10000000){
                    $('.download').val(10000000);
                    dataEos.attrEos('download',$('.download').val());
                }
            }
            dataEos.attrEos('downloadSelect',$(this).val());
        });

        $(".space").keyup(function() {
            $(this).val(parseInt($(this).val()));
            if(dataEos.attrEos('spaceSelect') == 'GB'){
                if (parseInt($(this).val())>10000000000){
                    $(this).val(10000000000);
                }
            }else{
                if (parseInt($(this).val())>10000000){
                    $(this).val(10000000);
                }
            }
            dataEos.attrEos('space',$(this).val());
        });

        $(".flow").keyup(function() {
            $(this).val(parseInt($(this).val()));
            if(dataEos.attrEos('flowSelect') == 'GB'){
                if (parseInt($(this).val())>10000000000){
                    $(this).val(10000000000);
                }
            }else{
                if (parseInt($(this).val())>10000000){
                    $(this).val(10000000);
                }
            }
            dataEos.attrEos('flow',$(this).val());
        });

        $(".download").keyup(function() {
            $(this).val(parseInt($(this).val()));
            if(dataEos.attrEos('downloadSelect') == 'GB'){
                if (parseInt($(this).val())>10000000000){
                    $(this).val(10000000000);
                }
            }else{
                if (parseInt($(this).val())>10000000){
                    $(this).val(10000000);
                }
            }
            dataEos.attrEos('download',$(this).val());
        });

        $(".request").keyup(function() {
            $(this).val(parseInt($(this).val()));
            if (parseInt($(this).val())>10000000){
                $(this).val(10000000);
            }

            dataEos.attrEos('request',$(this).val());
        });
        
        var dataEch = new FormData(),dataArray = JSON.parse($.cookie("priceview") || '[]');
        dataEch.renderFormEch();

        var dataEcd = new FormData();
        dataEcd.renderFormEcd();

        var dataSna = new FormData();
        dataSna.renderFormSna();

        var dataVpc = new FormData();
        dataVpc.renderFormVpc();

        var dataEip = new FormData();
        dataEip.renderFormEip();

        var dataEos = new FormData();
        dataEos.renderFormEos();
        $.cookie("priceview",JSON.stringify(dataArray),{path:'/'});

        $('.purchase span').click(function(){
            $('.purchase span').removeClass("current");
            $(this).addClass("current");
            var value = $(this).attr('data-value');
            if(value == 'monthly'){
                $('#progressEch').parent().show();
                $('#progressEcd').parent().show();
                $('#progressVpc').parent().show();
                $('#progressEip').parent().show();
            }else{
                $('#progressEch').parent().hide();
                $('#progressEcd').parent().hide();
                $('#progressVpc').parent().hide();
                $('#progressEip').parent().hide();
            }

            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch.attrEch('purchase',value);
                dataEch.renderFormEch();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd.attrEcd('purchase',value);
                dataEcd.renderFormEcd();
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc.attrVpc('purchase',value);
                dataVpc.renderFormVpc();
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip.attrEip('purchase',value);
                dataEip.renderFormEip();
            }
        });

        function editView(i,product){
            $('.save').show();
            $('.cancel').show();
            $('.view').hide();
            $(".edit").hide();
            $(".delete").hide();
            $(".jiage_view_content").eq(i).addClass("detail_edit");
            $(".jiage_view_content").eq(i).find(".edit").css("background-position","bottom left");

            if ($(".detail_edit").children(".edit_buy_message").text().indexOf("月")!=-1){
                $('.purchase span').removeClass("current");
                $('.purchase span').eq(0).addClass("current");
                $('#progressEch').parent().show();
                $('#progressEcd').parent().show();
                $('#progressVpc').parent().show();
                $('#progressEip').parent().show();
            }else if($(".detail_edit").children(".edit_buy_message").text().indexOf("时")!=-1){
                $('#progressEch').parent().hide();
                $('#progressEcd').parent().hide();
                $('#progressVpc').parent().hide();
                $('#progressEip').parent().hide();
                $('.purchase span').removeClass("current");
                $('.purchase span').eq(1).addClass("current");
            }

            if(product=="ech"){               
                dataEch = new FormData(dataArray[i]);
                dataEch.renderFormEch();
            }else if(product=="ecd"){
                dataEcd = new FormData(dataArray[i]);
                dataEcd.renderFormEcd();
            }else if(product=="sna"){
                dataSna = new FormData(dataArray[i]);
                dataSna.renderFormSna();
            }else if(product=="vpc"){
                dataVpc = new FormData(dataArray[i]);
                dataVpc.renderFormVpc();
            }else if(product=="eip"){
                dataEip = new FormData(dataArray[i]);
                dataEip.renderFormEip();
            }else if(product=="eos"){
                dataEos = new FormData(dataArray[i]);
                dataEos.renderFormEos();
            }
            $.cookie("priceview",JSON.stringify(dataArray),{path:'/'});
            
        };


        function deleteView(i,product){
            dataArray.splice(i,1);
            $.cookie("priceview",JSON.stringify(dataArray),{path:'/'});

            drawView();
            total();
        };

        $(".view").click(function() {
            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                var view = dataEch.createViewEch(),i = dataArray.length;
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                var view = dataEcd.createViewEcd(),i = dataArray.length;
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                var view = dataSna.createViewSna(),i = dataArray.length;
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                var view = dataVpc.createViewVpc(),i = dataArray.length;
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                var view = dataEip.createViewEip(),i = dataArray.length;
            }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                var view = dataEos.createViewEos(),i = dataArray.length;
            }

            view.find('.edit').click(function () {
                var  product = $(this).parent().parent().children('p').find(".current_product").html();
                if(product=="云主机"){
                    window.location.href = "http://www.eayun.com/price/ech/list.shtml?i="+i+"&product=ech";
                }else if(product=="云硬盘"){
                    window.location.href = "http://www.eayun.com/price/ecd/list.shtml?i="+i+"&product=ecd";
                }else if(product=="云硬盘快照"){
                    window.location.href = "http://www.eayun.com/price/snapshot/list.shtml?i="+i+"&product=sna";
                }else if(product=="私有网络"){
                    window.location.href = "http://www.eayun.com/price/vpc/list.shtml?i="+i+"&product=vpc";
                }else if(product=="弹性公网IP"){
                    window.location.href = "http://www.eayun.com/price/eip/list.shtml?i="+i+"&product=eip";
                }else if(product=="对象存储"){
                    window.location.href = "http://www.eayun.com/price/eos/list.shtml?i="+i+"&product=eos";
                }
            });

            view.find('.delete').click(function () {
                var  product = $(this).parent().parent().children('p').find(".current_product").html();
                deleteView(i,product);
            });

            $('.jiage_view').append(view);

            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataArray.push(dataEch.getDataEch());
                dataEch = new FormData($.extend({},dataEch.getDataEch()));
                dataEch.renderFormEch();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataArray.push(dataEcd.getDataEcd());
                dataEcd = new FormData($.extend({},dataEcd.getDataEcd()));
                dataEcd.renderFormEcd();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataArray.push(dataSna.getDataSna());
                dataSna = new FormData($.extend({},dataSna.getDataSna()));
                dataSna.renderFormSna();
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataArray.push(dataVpc.getDataVpc());
                dataVpc = new FormData($.extend({},dataVpc.getDataVpc()));
                dataVpc.renderFormVpc();
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataArray.push(dataEip.getDataEip());
                dataEip = new FormData($.extend({},dataEip.getDataEip()));
                dataEip.renderFormEip();
            }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                dataArray.push(dataEos.getDataEos());
                dataEos = new FormData($.extend({},dataEos.getDataEos()));
                dataEos.renderFormEos();
            }
            $.cookie("priceview",JSON.stringify(dataArray),{path:'/'});
            total();
        });

        $('.save').click(function(){
            $('.save').hide();
            $('.cancel').hide();
            $('.view').show();
            $(".edit").fadeIn();
            $(".delete").fadeIn();
            $(".jiage_view_content").removeClass("detail_edit");
            $(".jiage_view_content .edit").fadeIn().css("background-position","top left");
            $('#progressEch').parent().show();
            $('#progressEcd').parent().show();
            $('#progressVpc').parent().show();
            $('#progressEip').parent().show();

            $.cookie("priceview",JSON.stringify(dataArray),{path:'/'});
            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch = new FormData();
                dataEch.renderFormEch();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd = new FormData();
                dataEcd.renderFormEcd();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataSna = new FormData();
                dataSna.renderFormSna();
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc = new FormData();
                dataVpc.renderFormVpc();
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip = new FormData();
                dataEip.renderFormEip();
            }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                dataEos = new FormData();
                dataEos.renderFormEos();
            }

            $('.purchase span').removeClass("current");
            $('.purchase span').eq(0).addClass("current");
            drawView();
            total();
        });

        $('.cancel').click(function(){
            $('.save').hide();
            $('.cancel').hide();
            $('.view').show();
            $(".delete").fadeIn();
            $(".jiage_view_content").removeClass("detail_edit");
            $(".edit").fadeIn().css("background-position","top left");
            $('#progressEch').parent().show();
            $('#progressEcd').parent().show();
            $('#progressVpc').parent().show();
            $('#progressEip').parent().show();

            dataArray = JSON.parse($.cookie("priceview") || '[]');
            if($(".jiage_top_title .biaoti1").html()=="云主机"){
                dataEch = new FormData();
                dataEch.renderFormEch();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘"){
                dataEcd = new FormData();
                dataEcd.renderFormEcd();
            }else if($(".jiage_top_title .biaoti1").html()=="云硬盘快照"){
                dataSna = new FormData();
                dataSna.renderFormSna();
            }else if($(".jiage_top_title .biaoti1").html()=="私有网络"){
                dataVpc = new FormData();
                dataVpc.renderFormVpc();
            }else if($(".jiage_top_title .biaoti1").html()=="弹性公网IP"){
                dataEip = new FormData();
                dataEip.renderFormEip();
            }else if($(".jiage_top_title .biaoti1").html()=="对象存储"){
                dataEos = new FormData();
                dataEos.renderFormEos();
            }

            $('.purchase span').removeClass("current");
            $('.purchase span').eq(0).addClass("current");
        });


        function drawView(){
            $('.jiage_view .jiage_view_content').remove();
            $.each(dataArray,function (index,element) {
                var _data = new FormData(element);
                if(dataArray[index].product=="ech"){
                    var view = _data.createViewEch();
                }else if(dataArray[index].product=="ecd"){
                    var view = _data.createViewEcd();
                }else if(dataArray[index].product=="sna"){
                    var view = _data.createViewSna();
                }else if(dataArray[index].product=="vpc"){
                    var view = _data.createViewVpc();
                }else if(dataArray[index].product=="eip"){
                    var view = _data.createViewEip();
                }else if(dataArray[index].product=="eos"){
                    var view = _data.createViewEos();
                }
                view.find('.edit').click(function () {
                    var  product = $(this).parent().parent().children('p').find(".current_product").html();
                    if(product=="云主机"){
                        window.location.href = "http://www.eayun.com/price/ech/list.shtml?i="+index+"&product=ech";
                    }else if(product=="云硬盘"){
                        window.location.href = "http://www.eayun.com/price/ecd/list.shtml?i="+index+"&product=ecd";
                    }else if(product=="云硬盘快照"){
                        window.location.href = "http://www.eayun.com/price/snapshot/list.shtml?i="+index+"&product=sna";
                    }else if(product=="私有网络"){
                        window.location.href = "http://www.eayun.com/price/vpc/list.shtml?i="+index+"&product=vpc";
                    }else if(product=="弹性公网IP"){
                        window.location.href = "http://www.eayun.com/price/eip/list.shtml?i="+index+"&product=eip";
                    }else if(product=="对象存储"){
                        window.location.href = "http://www.eayun.com/price/eos/list.shtml?i="+index+"&product=eos";
                    }
                });
                view.find('.delete').click(function () {
                    var  product = $(this).parent().parent().children('p').find(".current_product").html();
                    deleteView(index,product);
                });

                $('.jiage_view').append(view);
            });
        };

        drawView();

        $("input").keyup(function(e) {
            this.value=this.value.replace(/[^\d]/g,'');
            if ($(this).val()==''){
                $(this).val(0);
            }
        });

        $(document).keydown(function(event){ 
            if(event.keyCode == 116 || (event.keyCode == 17 && event.keyCode == 116) ){
                if(window.location.href.indexOf("ech")!=-1){
                    window.location.href = "http://www.eayun.com/price/ech/list.shtml";
                }else  if(window.location.href.indexOf("ecd")!=-1){
                    window.location.href = "http://www.eayun.com/price/ecd/list.shtml";
                }else  if(window.location.href.indexOf("snapshot")!=-1){
                    window.location.href = "http://www.eayun.com/price/snapshot/list.shtml";
                }else  if(window.location.href.indexOf("vpc")!=-1){
                    window.location.href = "http://www.eayun.com/price/vpc/list.shtml";
                }else  if(window.location.href.indexOf("eip")!=-1){
                    window.location.href = "http://www.eayun.com/price/eip/list.shtml";
                }else  if(window.location.href.indexOf("eos")!=-1){
                    window.location.href = "http://www.eayun.com/price/eos/list.shtml";
                }
                return false; 
            } 
        }); 

        if(window.location.href.indexOf("i=")!=-1){
            (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]); return null;
                }
            })(jQuery);
            var index = $.getUrlParam('i');
                product = $.getUrlParam('product');
            editView(index,product);
        }

        total();
    });
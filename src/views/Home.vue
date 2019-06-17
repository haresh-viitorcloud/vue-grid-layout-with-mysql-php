<template>
    <grid-layout :layout.sync="layout" :col-num="12" :row-height="30" :is-draggable="true" :is-resizable="true"
        :is-mirrored="false" :vertical-compact="true" :margin="[10, 10]" :use-css-transforms="true"
        @layout-created="layoutCreatedEvent" @layout-before-mount="layoutBeforeMountEvent"
        @layout-mounted="layoutMountedEvent" @layout-ready="layoutReadyEvent" @layout-updated="layoutUpdatedEvent">
        <grid-item v-for="item in layout" :key="item.id" :x="item.x" :y="item.y" :w="item.w" :h="item.h" :i="item.i"
            @resize="resizeEvent" @move="moveEvent" @resized="resizedEvent" @moved="movedEvent">
            {{item.i}}
        </grid-item>
        
    </grid-layout>


</template>

<script>
    // @ is an alias to /src
    import HelloWorld from '@/components/HelloWorld.vue'
    import VueGridLayout from 'vue-grid-layout';


    var GridLayout = VueGridLayout.GridLayout;
    var GridItem = VueGridLayout.GridItem;
    export default {
        components: {
            GridLayout,
            GridItem,
        },
        data: function () {
            return {
                grid_json_data:[],
                layout: [{
                    "x": 0,
                    "y": 0,
                    "w": 2,
                    "h": 2,
                    "i": "0"
                }, {
                    "x": 2,
                    "y": 0,
                    "w": 2,
                    "h": 4,
                    "i": "1"
                }, {
                    "x": 4,
                    "y": 0,
                    "w": 2,
                    "h": 5,
                    "i": "2"
                }, {
                    "x": 6,
                    "y": 0,
                    "w": 2,
                    "h": 3,
                    "i": "3"
                }],
            };
        },
        template: [
            '<div>',
            '<div id="content" v-if="layout">',
            '<grid-layout',
            ':layout.sync="layout"',
            ':col-num="12"',
            ':row-height="30"',
            ':is-draggable="true"',
            ':is-resizable="true"',
            ':vertical-compact="true"',
            ':margin="[10, 10]"',
            ':use-css-transforms="true">',
            '<grid-item v-for="item in layout"',
            ':x.sync="item.x"',
            ':y.sync="item.y"',
            ':w.sync="item.w"',
            ':h.sync="item.h"',
            ':i="item.i">',
            '<button v-touch:tap="tap" @click="click">click me!</button>',
            '</grid-item>',
            '</grid-layout>',
            '</div>',
            '</div>'
        ].join(' '),

        computed: {},
        ready: function () {
            var vm = this;
        },

        methods: {
            click: function () {
                alert('clicked')
            },
            tap: function () {
                alert('TAP')
            },
            layoutCreatedEvent: function (newLayout) {
                console.log("Created layout: ", newLayout)
            },
            layoutBeforeMountEvent: function (newLayout) {
                console.log("beforeMount layout: ", newLayout)
            },
            layoutMountedEvent: function (newLayout) {
                console.log("Mounted layout: ", newLayout)
            },
            layoutReadyEvent: function (newLayout) {
                this.axios.get('http://localhost/vue/store.php').then((res) => {
                    const result = JSON.parse(res.data);
                    console.log("finalData :" +result.grid_json_data);
                    this.layout = result.grid_json_data;
                });
                console.log("Ready layout: ", this.layout)
            },
            layoutUpdatedEvent: function (newLayout) {
                console.log("Updated layout: ", newLayout)
            const options = {
                method: 'POST',
                headers: { 'content-type': 'application/json' },
                data: {grid_json_data:newLayout},
                url: 'http://localhost/vue/store.php',
            };
            this.axios(options)
                .then( function(response) {
                    console.log("finalData" +JSON.parse(res.data))
                })
                .catch(err => console.log(err));
            },
            moveEvent: function (i, newX, newY) {
                console.log("MOVE i=" + i + ", X=" + newX + ", Y=" + newY);
            },
            resizeEvent: function (i, newH, newW, newHPx, newWPx) {
                console.log("RESIZE i=" + i + ", H=" + newH + ", W=" + newW + ", H(px)=" + newHPx + ", W(px)=" +
                    newWPx);
            },
            movedEvent: function (i, newX, newY) {
                console.log("MOVED i=" + i + ", X=" + newX + ", Y=" + newY);
            },
            resizedEvent: function (i, newH, newW, newHPx, newWPx) {
                console.log("RESIZED i=" + i + ", H=" + newH + ", W=" + newW + ", H(px)=" + newHPx + ", W(px)=" +
                    newWPx);
            },

        },
    };
</script>
<style>
    .vue-grid-layout {
        background: #eee;
    }

    .layoutJSON {
        background: #ddd;
        border: 1px solid black;
        margin-top: 10px;
        padding: 10px;
    }

    .eventsJSON {
        background: #ddd;
        border: 1px solid black;
        margin-top: 10px;
        padding: 10px;
        height: 100px;
        overflow-y: scroll;
    }

    .columns {
        -moz-columns: 120px;
        -webkit-columns: 120px;
        columns: 120px;
    }



    .vue-resizable-handle {
        z-index: 5000;
        position: absolute;
        width: 20px;
        height: 20px;
        bottom: 0;
        right: 0;
        background: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pg08IS0tIEdlbmVyYXRvcjogQWRvYmUgRmlyZXdvcmtzIENTNiwgRXhwb3J0IFNWRyBFeHRlbnNpb24gYnkgQWFyb24gQmVhbGwgKGh0dHA6Ly9maXJld29ya3MuYWJlYWxsLmNvbSkgLiBWZXJzaW9uOiAwLjYuMSAgLS0+DTwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DTxzdmcgaWQ9IlVudGl0bGVkLVBhZ2UlMjAxIiB2aWV3Qm94PSIwIDAgNiA2IiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmMDAiIHZlcnNpb249IjEuMSINCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiDQl4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjZweCIgaGVpZ2h0PSI2cHgiDT4NCTxnIG9wYWNpdHk9IjAuMzAyIj4NCQk8cGF0aCBkPSJNIDYgNiBMIDAgNiBMIDAgNC4yIEwgNCA0LjIgTCA0LjIgNC4yIEwgNC4yIDAgTCA2IDAgTCA2IDYgTCA2IDYgWiIgZmlsbD0iIzAwMDAwMCIvPg0JPC9nPg08L3N2Zz4=');
        background-position: bottom right;
        padding: 0 3px 3px 0;
        background-repeat: no-repeat;
        background-origin: content-box;
        box-sizing: border-box;
        cursor: se-resize;
    }

    .vue-grid-item:not(.vue-grid-placeholder) {
        background: #ccc;
        border: 1px solid black;
    }

    .vue-grid-item.resizing {
        opacity: 0.9;
    }

    .vue-grid-item.static {
        background: #cce;
    }

    .vue-grid-item .text {
        font-size: 24px;
        text-align: center;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;
        height: 24px;
    }

    .vue-grid-item .minMax {
        font-size: 12px;
    }

    .vue-grid-item .add {
        cursor: pointer;
    }
</style>
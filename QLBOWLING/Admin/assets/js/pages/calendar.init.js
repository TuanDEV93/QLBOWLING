var hiddenField = document.getElementById('MainContent_hiddenData');
var data = JSON.parse(hiddenField.value);
!function (l) {
    "use strict";
    var e = function () {
        this.$body = l("body"),
            this.$modal = l("#modal-schedule"),
            this.$event = "#external-events div.external-event",
            this.$calendar = l("#calendar"),
            this.$closeScheduleBtn = l(".close-schedule"),
            this.$saveScheduleBtn = l(".save-schedule"),
            this.$scheduleForm = l("#modal-schedule .modal-content"),
            this.$extEvents = l("#external-events"),
            this.$calendarObj = null
    };
    e.prototype.onDrop = function (e, n) {
        var t = e.data("eventObject"),
            a = e.attr("data-class"),
            o = l.extend({}, t);
        o.start = n,
            a && (o.className = [a]),
            this.$calendar.fullCalendar("renderEvent", o, !0),
            l("#drop-remove").is(":checked") && e.remove()
    },
        e.prototype.onEventClick = function (n, e, t) {
        var ddlCountPlayer = document.getElementById('MainContent_ddlCountPlayer');
        var option = ddlCountPlayer.querySelector('option[value="' + n.count + '"]');
        option.selected = true;
        var a = this,
            o = l("<form></form>");
        a.$modal.modal({ backdrop: "static" }),
            a.$modal.find(".modal-title").empty().append("Thông tin lịch đặt").end().
                find(".save-schedule").hide().end().
                find(".update-schedule").show().end().
                find("#MainContent_txtName").empty().val(n.name).end().
                find("#MainContent_txtBookingID").empty().val(n.ScheduleID).end().
                find("#MainContent_txtEmail").empty().val(n.email).end().
                find("#MainContent_txtPhone").empty().val(n.phone).end().
                find("#MainContent_txtDate").empty().val(n.date).end().
                find(".delete-schedule").show().end().
                find(".save-event").hide().end().
                find(".modal-body").prepend(o).end().
                find("#scheduleID").show().end().
                find(".delete-schedule").unbind("click").click(function () {
                    a.$calendarObj.fullCalendar("removeEvents", function (e) { return e._id == n._id }),
                        a.$modal.modal("hide")
                }),
            a.$modal.find("form").on("submit", function () {
                return n.title = o.find("input[type=text]").val(),
                    a.$calendarObj.fullCalendar("updateEvent", n),
                    a.$modal.modal("hide"), !1
            })
        },
        e.prototype.enableDrag = function () {
        l(this.$event).each(function () {
            var e = {
                title: l.trim(l(this).text())
            };
            l(this).data("eventObject", e),
                l(this).draggable({ zIndex: 999, revert: !0, revertDuration: 0 })
        })
        },
        e.prototype.init = function () {
            this.enableDrag();
            var e = new Date,
                n = (e.getDate(),
                    e.getMonth(),
                    e.getFullYear(),
                    new Date(l.now())),
                t = data,
            a = this;
        console.log(t);
            a.$calendarObj = a.$calendar.fullCalendar({
                slotDuration: "00:15:00",
                minTime: "10:00:00",
                maxTime: "21:30:00",
                defaultView: "month",
                handleWindowResize: !0,
                height: l(window).height() - 300,
                header: {
                    left: "prev,next today",
                    center: "title", right: "month,agendaWeek,agendaDay"
                },
                events: t,
                editable: !0,
                droppable: !0,
                eventLimit: !0,
                selectable: !0,
                drop: function (e) {
                    a.onDrop(l(this), e)
                },
                eventClick: function (e, n, t) {
                    a.onEventClick(e, n, t)
                }
            }),
                //this.$saveScheduleBtn.on("click", function () {
                //    var e = a.$scheduleForm.find("input[name='category-name']").val(),
                //        n = a.$scheduleForm.find("select[name='category-color']").val();
                //    null !== e && 0 != e.length && (a.$extEvents.append('<div class="external-event bg-' + n + '" data-class="bg-' + n + '" style="position: relative;"><i class="mdi mdi-checkbox-blank-circle m-r-10 vertical-middle"></i>' + e + "</div>"),
                //        a.enableDrag())
                //}),
                this.$closeScheduleBtn.on("click", function () {
                    var e = a.$scheduleForm.find("input[type=text]").val(null).end().
                        find(".save-schedule").show().end().
                        find(".update-schedule").hide().end().
                        find("#scheduleID").hide().end().
                        find(".delete-schedule").hide(),
                        n = a.$scheduleForm.find("select[name='category-color']").val();
                })
        },
        l.CalendarApp = new e, l.CalendarApp.Constructor = e
}(window.jQuery), function (e) { "use strict"; window.jQuery.CalendarApp.init() }();
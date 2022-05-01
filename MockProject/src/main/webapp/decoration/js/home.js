function loadRoomlist(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png" class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("roomlistView.jsp #load", function() {
            var table = $('#extable').DataTable();
            table.on( 'click', '.edit', function () {
                var data = table.row( $(this).parents('tr') ).data();
                $('#roomNumber').val(data[1]);
                $('#roomCapacity').val(data[2]);
                $('#roomStatus').val(data[3]);
                $('#roomPrice').val(data[4]);
                $('#roomDescription').val(data[5]);
            } );
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    }, 500);

}

function loadBooked(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("bookingView.html #load", function() {
            $('#bookedTable').DataTable();
            $('[data-toggle="tooltip"]').tooltip();
            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    }, 500);
}

function loadCheckin(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("checkinView.html #load", function() {
            $('#checkinTable').DataTable();
            $('[data-toggle="tooltip"]').tooltip();
            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    }, 500);
}

function loadCheckout(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("checkoutView.html #load", function() {
            $('#checkoutTable').DataTable();
        });
    }, 500);
}

function loadService(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        child.innerHTML = '<h1>Success...</h1>';
        $('#child').load("serviceView.html #load", function() {
            var table=$('#serviceTable').DataTable();
            table.on( 'click', '.edit', function () {
                var data = table.row( $(this).parents('tr') ).data();
                $('#serviceName').val(data[1]);
                $('#picture').val(data[2]);
                $('#servicePrice').val(data[3]);
                $('#des').val(data[4]);
            } );
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });

        });
    }, 500);
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function loadUser(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("userView.html #load", function() {
            $('#userTable').DataTable();
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });

        });
    }, 500);
}

function loadReservation(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("reservationView.html #load", function() {
            $('#reserveTable').DataTable();
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });

        });
    }, 500);
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
// function loadService(id) {
//     var child = document.getElementById("child");
//     child.innerHTML = '<h1>Loading...</h1>';
//     setTimeout(() => {
//         child.innerHTML = '<h1>Success...</h1>';
//         $('#child').load("serviceView.html #load");
//     }, 500);
// }
function loadRoomcategory(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("roomcateView.html #load", function() {
            var table= $('#categoryTable').DataTable();
            table.on( 'click', '.edit', function () {
                var data = table.row( $(this).parents('tr') ).data();
                $('#categoryRoom').val(data[1]);
                $('#categoryName').val(data[2]);
                $('#categoryPrice').val(data[3]);
            } );
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function() {
                if (this.checked) {
                    checkbox.each(function() {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function() {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function() {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });

        });
    }, 500);
   
}

function loadRevenue(id) {
    var child = document.getElementById("child");
    child.innerHTML = '<img src="${pageContext.request.contextPath}/decoration/image/dragon.png " class="loading" alt="dragon" width="190px" height="190px" style ="display:block; margin: auto;">';
    setTimeout(() => {
        $('#child').load("revenueView.html #revenue", function() {
            google.charts.load("current", { packages: ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ["Element", "Revenue", { role: "style" }],
                    ["1", 894, "blue"],
                    ["2", 10, "blue"],
                    ["3", 1930, "blue"],
                    ["4", 9000, "blue"],
                    ["5", 894, "blue"],
                    ["6", 1049, "blue"],
                    ["7", 1930, "blue"],
                    ["8", 9000, "blue"],
                    ["9", 0, "blue"],
                    ["10", 1049, "blue"],
                    ["11", 1930, "blue"],
                    ["12", 9000, "blue"]
                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {
                        calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"
                    },
                    2
                ]);

                var options = {
                    title: "Revenue By Month ($/Month) in 2021",
                    width: 900,
                    height: 400,

                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                chart.draw(view, options);
            }
        });
    }, 500);
}

$(document).ready(function() {
    $.validator.addMethod("regex", function(value, element, regularExpression) {
        var re = new RegExp(regularExpression);
        return this.optional(element) || re.test(value);
    }, "Please follow the true format");

    $.validator.addMethod("greaterThan", function(value, element, greater) {
        return value >= greater;
    });

    $.validator.addMethod("lesserThan", function(value, element, lesser) {
        return value <= lesser;
    });

    $('#edit-room').validate({
        rules: {
            roomNumber: {
                regex: /^(A|B|C)[0-9]{4}$/,
                required: true,
            },
            roomCapacity: {
                regex: /^[0-9]$/,
                greaterThan: 1,
                lesserThan: 4,
                required: true,
            },
            roomStatus: {
                required: true,
            },
            roomPrice: {
                regex: /^[0-9]+$/,
                greaterThan: 1000,
                required: true,
            }
        },
        messages: {
            roomNumber: {
                regex: "Wrong format",
            },
            roomCapacity: {
                greaterThan: "At least 1 guest",
                lesserThan: "At max 4 guests",
                regex: "Only number",
            },
            roomPrice: {
                regex: "Only number",
                greaterTham: "At least 1000 dong",
            }
        }
    });

    $('#add-room').validate({
        rules: {
            roomNumber: {
                regex: /^(A|B|C)[0-9]{4}$/,
                required: true,
            },
            roomCapacity: {
                regex: /^[0-9]$/,
                greaterThan: 1,
                lesserThan: 4,
                required: true,
            },
            roomStatus: {
                required: true,
            },
            roomPrice: {
                regex: /^[0-9]+$/,
                greaterThan: 1000,
                required: true,
            }
        },
        messages: {
            roomNumber: {
                regex: "Wrong format",
            },
            roomCapacity: {
                greaterThan: "At least 1 guest",
                lesserThan: "At max 4 guests",
                regex: "Only number",
            },
            roomPrice: {
                regex: "Only number",
                greaterThan: "At least 1000 dong",
            }
        }
    });

    $.validator.addMethod('dateBefore', function (value, element, params) {
        // if end date is valid, validate it as well
        var end = $(params);
        if (!end.data('validation.running')) {
            $(element).data('validation.running', true);
            setTimeout($.proxy(

            function () {
                this.element(end);
            }, this), 0);
            // Ensure clearing the 'flag' happens after the validation of 'end' to prevent endless looping
            setTimeout(function () {
                $(element).data('validation.running', false);
            }, 0);
        }
        return this.optional(element) || this.optional(end[0]) || new Date(value) < new Date(end.val());

    }, 'Must be before corresponding end date');

    $.validator.addMethod('dateAfter', function (value, element, params) {
        // if start date is valid, validate it as well
        var start = $(params);
        if (!start.data('validation.running')) {
            $(element).data('validation.running', true);
            setTimeout($.proxy(

            function () {
                this.element(start);
            }, this), 0);
            setTimeout(function () {
                $(element).data('validation.running', false);
            }, 0);
        }
        return this.optional(element) || this.optional(start[0]) || new Date(value) > new Date($(params).val());

    }, 'Must be after corresponding start date');

    $('#add-booking').validate({
        rules: {
            checkInName: {
                required: true,
                regex: 
                /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/
            },
            checkInContact: {
                required: true, 
                regex: /^[0-9]{9}$/,
            },
            checkInStart: {
                required: true,
                dateBefore: '#Check-In-DateBoooking'
            },
            checkInEnd: {
                required: true,
                dateAfter: '#Check-Out-DateBooking'
            },
            checkInDayStay: {
                greaterThan: 1,
                required: true,
            }
        },
        messages: {
            checkInName: {
                regex: "Only characters"
            },
            checkInContact: {
                regex: "Only number and 9 digits"
            },
            checkInDayStay: {
                greaterThan: "At least "
            }
        }
    });

    $('#add-service').validate({
        rules: {
            serviceName: {
                required: true,
                regex: /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/
            },
            categoryName: {
                required: true, 
                regex: /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/
            },
            image: {
                required: true,
            },
            servicePrice: {
                regex: /^[0-9]+$/,
                greaterThan: 1000,
                required: true,
            }
        },
        messages: {
            serviceName: {
                regex: "Only character",
            },
            categoryName: {
                regex: "Only character"
            },
            servicePrice: {
                regex: "Only number",
                greaterThan: "At least 1000 dong"
            }
            
        }
    });

    $('#edit-service').validate({
        rules: {
            serviceName: {
                required: true,
                regex: /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/
            },
            categoryName: {
                required: true, 
                regex: /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$/
            },
            image: {
                required: true,
            },
            servicePrice: {
                regex: /^[0-9]+$/,
                greaterThan: 1000,
                required: true,
            }
        },
        messages: {
            serviceName: {
                regex: "Only character",
            },
            categoryName: {
                regex: "Only character"
            },
            servicePrice: {
                regex: "Only number",
                greaterThan: "At least 1000 dong"
            }
            
        }
    });
});
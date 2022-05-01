/**
 * 
 */
/*--------------------Roomlist Validation----------------------*/
$(document).ready(
	function() {	

		$.validator.addMethod("regex", function(value, element,
			regularExpression) {
			var re = new RegExp(regularExpression);
			return this.optional(element) || re.test(value);
		}, "Please follow the true format");

		$.validator.addMethod("greaterThan", function(value,
			element, greater) {
			return value >= greater;
		});

		$.validator.addMethod("lesserThan", function(value,
			element, lesser) {
			return value <= lesser;
		});

		$('#add-room').validate({
			rules: {
				roomNumber: {
					regex: /^(A|B|C)[0-9]{4}$/,
					required: true,
				},
				price: {
					regex: /^[0-9]+$/,
					greaterThan: 10,
					required: true,
				}
			},
			messages: {
				roomNumber: {
					required: "Room number is required",
					regex: "Wrong format",
				},
				price: {
					regex: "Only number",
					greaterThan: "At least 10$",
				}
			},
		});
	});
	
	/*--------------------Booking Validation----------------------*/
	
	$(document).ready(
				function() {
					$.validator.addMethod("regex", function(value, element,
							regularExpression) {
						var re = new RegExp(regularExpression);
						return this.optional(element) || re.test(value);
					}, "Please follow the true format");	
				    			
/*jQuery.validator.addMethod("greaterStart", function (value, element, params) {
    return this.optional(element) || new Date(value) >= new Date($(params).val());
},'Must be greater than start date.');*/

					$('#add-booking').validate({
						rules : {
							roomNumber: {
								regex : /^(A|B|C)[0-9]{4}$/,
								required : true,
							},
							nameCustomer:{
								  required: true,
					              regex: /^[a-zA-Z]{2,}$/,
							},
							identityNumber:{
								 required: true,
					             regex: /^[0-9]{9}$/,
							},
							phone:{
								  required: true,
	            	              regex: /^[0-9]{10}$/,
							},
							startDay:{
								  required: true,				                  
							},
							endDay:{
								  required: true,				                  
							},
	                        numberOfPeople:{
								min:1,
								max:4,
				                required: true,
							},
							
						}, 
						messages : {
							roomNumber : {
								 required: "Room Number is required",
								 regex : "Wrong format",
							},

							nameCustomer:{
								 required: "Customer Name is required",
	    				    	  regex: "Only characters",
							},
							identityNumber:{
								 required: "Identity Number is required",
					                regex: "Wrong Format",
							},
							phone:{
								required: "Phone is required",
				                regex: "Wrong Format",
							},
							startDay:{
				                regex: "Wrong Format",
							},
							endDay:{
								regex: "Wrong Format",
							},
							numberOfPeople:{
								required: "Number of People is required",
								regex: "Wrong Format",
							},
						}
						
					});					
				});
						/*--------------------RoomCate Validation----------------------*/
	$(document).ready(
			function() {
				$.validator.addMethod("regex", function(value, element,
						regularExpression) {
						     var re = new RegExp(regularExpression);
									return this.optional(element) || re.test(value);
								}, "Please follow the true format");

								$.validator.addMethod("greaterThan", function(value,
										element, greater) {
									return value >= greater;
								});
								$('#category-room-edit').validate({
									rules : {
										categoryRoom: {
											required : true,
											regex : /^[a-zA-Z]+$/,
										},
										capacity:{
											min:1,
											max:8,
							                required: true,
										}
										
									}, 
									messages : {
										 catRoomName:{
									            regex: "Wrong format",
									            required:"Room Category Name is required",
									        },
									        capacity:{
									            regex:"Capacity start from 1 to 8",
									            required:"Capacity is required"
									        }
									},
									
								});
								$('#category-room').validate({
									rules : {
										catRoomName: {
							            	regrex:/^[a-zA-Z]+$/,
							                required:true,
							            },
							            capacity:{
											min:1,
											max:8,
							                required: true,
										}
										
									},
								
									messages : {
										 catRoomName:{
									            regex: "Wrong format",
									            required:"Room Category Name is required",
									        },
									        capacity:{
									            regex:"Capacity start from 1 to 8",
									            required:"Capacity is required"
									        }
									}
								});	
					$('#edit-room').validate({
							rules: {
				roomNumber: {
					regex: /^(A|B|C)[0-9]{4}$/,
					required: true,
				},
				price: {
					regex: /^[0-9]+$/,
					greaterThan: 10,
					required: true,
				}
			},
			messages: {
				roomNumber: {
					required: "Room number is required",
					regex: "Wrong format",
				},
				price: {
					regex: "Only number",
					greaterThan: "At least 10$",
				}
			},
		});
							});
							/*--------------------Servicecate Validation----------------------*/
							$(document).ready(function() {
					$.validator.addMethod("regex", function(value, element,
							regularExpression) {
						var re = new RegExp(regularExpression);
						return this.optional(element) || re.test(value);
					}, "Please follow the true format");

					$.validator.addMethod("greaterThan", function(value,
							element, greater) {
						return value >= greater;
					});
					$('#category-service').validate({
						 rules : {
							 catSerName: {
								required : true,
								regex : /^[a-zA-Z]{2,}/,
							}
						},
					 	  messages : {
					 	 	catSerName: {
								required : "Service Category is required",
								regex : "Only character",	
							} 
						}  
						 
					
					});

				 	$('#edit-category-service').validate({
						rules : {
							categorySerName : {
								required : true,
								regex : /^[a-zA-Z]{2,}/,
							},
						},
					
						messages : {
							categorySerName : {
							    required : "Service Category is required",
								regex :"Only character"
							}
						}
					});
		});
		
		/*--------------------Service Validation----------------------*/	
		$(document).ready(function() {
			$.validator.addMethod("regex", function(value, element,
					regularExpression) {
				var re = new RegExp(regularExpression);
				return this.optional(element) || re.test(value);
			}, "Please follow the true format");

			$.validator.addMethod("greaterThan", function(value,
					element, greater) {
				return value >= greater;
			});

			$('#add-service').validate({
				rules : {
					serName : {
						required : true,
						regex : /^[a-zA-Z]{2,}/,
					},
					categoryName : {
						required : true,
						regex : /^[a-zA-Z]{2,}/,
					},
					price : {
						min : 1,
						required : true,
					}
				},
				messages : {
					serName : {
						regex : "Only character",
						required : "Service name is required"
					},
					categoryName : {
						regex : "Only character",
						required : "Service Category is required"
					},
					price : {
						regex : "Only number",			
						min : "At least 1$"			
					}

				}
			});

			$('#edit-service').validate({
				rules : {
					serviceName : {
						required : true,
						regex : /^[a-zA-Z]{2,}/,
					},
					categoryName : {
						required : true,
						regex : /^[a-zA-Z]{2,}/,
					},
					image : {
						required : true,
					},
					servicePrice : {
						regex : /^[0-9]+$/,
						greaterThan : 1,
						required : true,
					}
				},
				messages : {
					serviceName : {
						required : "Service name is required",
						regex : "Only character",
					},
					categoryName : {
						required : "Service Category is required",
						regex : "Only character"
					},
					servicePrice : {
						required : "Price is required",
						regex : "Only number",
						greaterThan : "At least 1$"
					}
				}
			});

		});
		/*--------------------Staff Validation----------------------*/	
		$(document).ready(function() {
			$.validator.addMethod("regex", function(value, element,
					regularExpression) {
				var re = new RegExp(regularExpression);
				return this.optional(element) || re.test(value);
			}, "Please follow the true format");

			$('#edit-staff').validate({ 
				 rules: {
					  fullName: {
			                required: true,
			                regex: /^[a-zA-Z]{2,}/,
			            }, 
			           username: {
			                required: true,
			                minlength: 5,
			                maxlength: 30,
			            },
			            birthDate: {
			                required: true,			              
			            },
			            phone: {
			                required: true,
			                regex: /^[0-9]{10}$/,
			            },
			            identityNumber: {
			                required: true,
			                regex: /^[0-9]{9}$/,
			            }, 
			        },
		 	        messages: {
			        	fullName: {
				                required: "Full Name is required",
				                 regex: "Only Character", 
				             }, 
				               username: {
				                required: "UserName is required",
				                regrex: "Length from 5 to 30",
				            },
				            birthDate: {
				                required: "Birthdate is required",				                
				            },
				            phone: {
				                required: "Phone is required",
				                regex: "Wrong Format",
				            },
				            idenityNumber: {
				                required: "Identity Number is required",
				                regex: "Wrong Format",
				            },  
			        } 
			    });
			    
			
			$('#add-user').validate({
				 rules: {
			            fullName: {
			                required: true,
			                regex: /^[a-zA-Z]{2,}/,
			            },
			            username: {
			                required: true,
			                minlength: 5,
			                maxlength: 30,
			            },
			            password: {
			                required: true,
			                regex: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/,
			                minlength: 8,
			            },
			            birthDate: {
			                required: true,			                
			            },
			            phone: {
			                required: true,
			                regex: /^[0-9]{10}$/,
			            },
			            idenityNumber: {
			                required: true,
			                regex: /^[0-9]{9}$/,
			            },
			            email: {
			                required: true,
			                regex: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
			            }
			        },
			        messages: {
			            fullName: {
			                required: "Full Name is required",
			                regex: "Only Character",
			            },
			            username: {
			                required: "UserName is required",
			                regrex: "Length from 5 to 30"
			            },
			            password: {
			                required: "Password is required",
			                regex: "At least 8 digits",
			                minlength: 8,
			            },
			            birthDate: {
			                required: "Birthdate is required",			                
			            },
			            phone: {
			                required: "Phone is required",
			                regex: "Wrong Format",
			            },
			            idenityNumber: {
			                required: "Identity Number is required",
			                regex: "Wrong Format",
			            },
			            email: {
			                required: "Email is required",
			                regex: "Wrong Format",
			            },
			        }
			}); 
		});
		/*--------------------Reservation Validation----------------------*/					

		$(document)
				.ready(
						function() {

							/* $(document).on('click', '#choose', function() {
								$('#details').toggle("slide");
							}); */

							$('#categoryName')
									.change(
											function() {
												var categoryId = $(this).val();
												//alert(categoryId);
												$
														.ajax({
															type : 'GET',
															url : "/MockProject/addServiceDetails/"
																	+ categoryId,
															success : function(
																	data) {
																var slctSubcat = $('#serviceName'), option1 = "";
																slctSubcat
																		.empty();

																for (var i = 0; i < data.length; i++) {
																	option1 = option1
																			+ "<option value='"+ data[i].id + "'>"
																			+ data[i].serName
																			+ "</option>";
																}
																slctSubcat
																		.append(option1);
															},
															error : function() {
																alert("error");
															}
														});
											});
						});
		
		
		
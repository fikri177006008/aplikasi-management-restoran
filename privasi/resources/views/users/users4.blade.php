@extends('layouts.dashboard2') 
@section('menu')  

  <li class="active">                           
    <a href="#" ><i class="fa fa-users"></i> <span>Users</span></a>
  </li>
  <li><a><i class="fa fa-home"></i> <span>Menu </span><span class="fa fa-angle-down"></span></a>
    <ul class="nav child_menu">
      <li><a href="{{url('/menu')}}" ><span>Food & Drink</span></a></li>
      <li><a href="{{url('/category')}}"  ><span>Category</span></a></li>
    </ul>
  </li>
  <li><a href="{{url('/list-menu')}}" ><i class="fa fa-shopping-cart"></i> <span>Add Order</span></a>
  </li>

  <li><a href="{{url('/order')}}" ><i class="fa fa-shopping-bag"></i> <span>Order</span></a>
  </li>
  
  <li><a><i class="fa fa-dollar"></i> <span>Transaction </span><span class="fa fa-angle-down"></span></a>
    <ul class="nav child_menu">
      <li><a href="{{url('/payment')}}"><span>Payment</span></a></li>
      <li><a href="{{url('/history')}}"><span>History</span></a></li>
    </ul>
  </li>

    <li><a href="{{url('/reports')}}" ><i class="fa fa-file"></i> <span>Reports</span></a>
    </li>
    <li><a href="{{url('/testimony')}}" ><i class="fa fa-star"></i> <span>Testimony</span></a>

@endsection 

@section('content')
 
<div id="dashboard-v1" class="right_col" role="main">
            <div class="spacer_30"></div>
            <div class="clearfix"></div>
            <div class="row">
              
            <div class="panel panel-default element-box-shadow">
              <div class="panel-heading padding_30">
                <h3 class="no-margin"><i class="fa fa-users"></i> Users</h3> <br>

                
                <div class="mT-30">

                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal"><i class="fa fa-2x fa-plus"></i></button>
                  <a class="btn btn-info" href="{{url('/users/print')}}"><i class="fa fa-print fa-2x "></i></a>
                  <br>
                  <br>
                  <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header" style="background-color:#ffe139;">
                          <h2 class="modal-title text-center" id="addModalLabel"><i class="fa fa-plus"></i> Add User</h2>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form action="{{url('/users/store')}}" method="post">
                            {{ csrf_field() }}
                            <label for="name">Name</label>
                            <input name="name" type="text" class="form-control">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control">
                            <label for="level">Level</label>
                            
                            <select name="level" id="level" class="form-control">
                                @foreach (\App\Level::all() as $level)
                                <option value="{{$level->id}}">{{$level->level}}</option>
                                @endforeach
                            </select>

                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-left fa-1x"></i></button> 
                          <button type="submit" class="btn btn-success" style="background-color:#ffe139; color:#000;">SAVE</button>
                        </div>
                      </form>

                      </div>
                    </div>

                    
                  </div>
                  <div class="panel-body dash-table-markets no-padding overflow-table">
                    <table id="trade-history" class="table table-cryptic dataTable no-footer" data-page-length="10" >
                       <thead>
                         <tr>
                           <th class="text-center">No</i></th>
                            <th class="text-center">Name</i></th>
                            {{-- <th class="text-center">Email </i></th> --}}
                            <th class="text-center">Password </i></th>
                            <th class="text-center">Level </i></th>
                            <th class="text-center">Option</th>
                     </tr>
                  </thead>
                   <tbody>
                     @foreach ($users as $i => $user)
            
                      <tr>
                      <td class="text-center"><p class="no-margin">{{++$i}}</p></td>
                          <td><p class="no-margin">{{$user->name}}</p></td>
                          {{-- <td><p class="no-margin">{{$user->email}}</p></td> --}}
                          <td class="text-center" ><p class="no-margin">Secret</p></td>

                          <td class="text-center no-wrap">
                        
                              <span class="label label-@php
                              if ($user->level_->level == "admin") {
                                  echo 'danger';
                              }
                              elseif ($user->level_->level == "owner") {
                                  echo 'warning';
                              }
                              elseif ($user->level_->level == "kasir") {
                                  echo 'info';
                              }
                              elseif ($user->level_->level == "waiter") {
                                  echo 'info';
                              }
                              elseif ($user->level_->level == "meja") {
                                  echo 'success';
                              }
                              @endphp ">
                                  {{$user->level_->level}}
                              </span></td>
                              <td class="text-center">
                            <a href="{{url('/users/edit/' . $user->id )}}">
                              <button  class="btn btn-info" ><i class="fa fa-edit fa-2x"></i></button>
                            </a>
                            <button type="button" class="btn btn-danger delete"><i class="fa fa-2x fa-trash"></i></button>
                      
                    <form action="{{url('/users/delete/'.$user->id)}}" method="post">
                          {{ csrf_field() }}
                          {{method_field('DELETE')}} 
                      </form>
                          </td>
                      </tr>
                       
                     @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
          
              
             </div>
           </div>
         </div>
       </div>

              @endsection

              @section('script')
              <script>
                $('.delete').click(function () {
                  var that = $(this);
                  swal({
                      title: 'Do you want to delete this data ?',
                      type: 'warning',
                      showCancelButton: true,
                      confirmButtonColor: '#3085d6',
                      cancelButtonColor: '#d33',
                      confirmButtonText: 'Hapus'
                    }).then((result) => {
                      if (result) {
                        that.siblings('form').submit();
                      }
                    })
                });
              </script>
        @endsection
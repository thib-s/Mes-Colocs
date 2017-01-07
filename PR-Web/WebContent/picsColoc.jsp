
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Pics of your Colocs</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>

<header>
	<div align="center" style="background-color:#3371B7; padding:50px; position:relative;">
		<font style="font-size:40pt; color:white;"><b>Mes Colocs</b></font>
		
			<div align="center" style="margin:auto; position:absolute; top:50%; transform:translateY(-50%); right:5%;">
				<form action="ColocServlet" method="post">
					<button type="submit" style="padding-left:16px; padding-right:16px; padding-bottom:10px; padding-top:10px; margin: auto; width: 100%; font-size:1.1em; color:white" class="btn btn-large btn btn-danger btn-lg btn-block" value="logOut" name="ok" ><b>Log Out</b></button>
				</form>
			</div>
			
	</div>
</header>

<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <h4 style="padding:10px;">Coloc Menu</h4>
      <ul class="nav nav-pills nav-stacked">
        <li ><a href="http://localhost:8080/PR-Web/homeColoc.jsp">Home</a></li>
        <li><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li><a href="http://localhost:8080/PR-Web/tasksColoc.jsp">Tasks</a></li>
        <li ><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li ><a href="http://localhost:8080/PR-Web/agendaColoc.jsp">Agenda</a></li>
        <li ><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li class="active"><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li ><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li ><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">
      <h4><small>Pics of your colocs</small></h4>
     
    	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
		<link rel="stylesheet" href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/bootstrap-image-gallery.css">
		<link rel="stylesheet" href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/demo.css">
		<div class="container">
		
		    <!-- The container for the list of example images -->
		    <div id="links">
		        <a data-gallery="" title="Natalia" href="http://farm4.static.flickr.com/3741/11188919165_b73f1ddc32_b.jpg">
		            <img src="http://farm4.static.flickr.com/3741/11188919165_b73f1ddc32_s.jpg">
		        </a>
		        <a data-gallery="" title="Delft Touch in the kitchen" href="http://farm4.static.flickr.com/3812/11188050815_5e8cccf0f6_b.jpg">
		            <img src="http://farm4.static.flickr.com/3812/11188050815_5e8cccf0f6_s.jpg">
		        </a>
		        <a data-gallery="" title="Father Figure Project: The Social Construct" href="http://farm4.static.flickr.com/3703/11191153143_04bbbc8301_b.jpg">
		            <img src="http://farm4.static.flickr.com/3703/11191153143_04bbbc8301_s.jpg">
		        </a>
		        <a data-gallery="" title="Higherbeams." href="http://farm4.static.flickr.com/3821/11190956343_09b8022ea2_b.jpg">
		            <img src="http://farm4.static.flickr.com/3821/11190956343_09b8022ea2_s.jpg">
		        </a>
		        <a data-gallery="" title="DSC_7489" href="http://farm4.static.flickr.com/3834/11187370596_195c175098_b.jpg">
		            <img src="http://farm4.static.flickr.com/3834/11187370596_195c175098_s.jpg">
		        </a>
		        <a data-gallery="" title="G-TCDC 2 A321-231S Thomas Cook Airlines UK(on del) MAN 03DEC13" href="http://farm4.static.flickr.com/3665/11192324763_729bd2eb5a_b.jpg">
		            <img src="http://farm4.static.flickr.com/3665/11192324763_729bd2eb5a_s.jpg">
		        </a>
		        <a data-gallery="" title="cold day..but nice" href="http://farm6.static.flickr.com/5546/11191357813_754fc41bde_b.jpg">
		            <img src="http://farm6.static.flickr.com/5546/11191357813_754fc41bde_s.jpg">
		        </a>
		        <a data-gallery="" title="Grinnell in B & W" href="http://farm8.static.flickr.com/7409/11190351243_5c9d34b844_b.jpg">
		            <img src="http://farm8.static.flickr.com/7409/11190351243_5c9d34b844_s.jpg">
		        </a>
		        <a data-gallery="" title="15th corner of metallic shadows" href="http://farm3.static.flickr.com/2824/11192248094_5239c5bb88_b.jpg">
		            <img src="http://farm3.static.flickr.com/2824/11192248094_5239c5bb88_s.jpg">
		        </a>
		        <a data-gallery="" title="The Receipt, Tesco Supermarket, Thornton Heath" href="http://farm3.static.flickr.com/2832/11190558394_4198ee9487_b.jpg">
		            <img src="http://farm3.static.flickr.com/2832/11190558394_4198ee9487_s.jpg">
		        </a>
		        <a data-gallery="" title="Golmaramara, Manisa" href="http://farm8.static.flickr.com/7378/11190583213_87c55a04b1_b.jpg">
		            <img src="http://farm8.static.flickr.com/7378/11190583213_87c55a04b1_s.jpg">
		        </a>
		        <a data-gallery="" title="IMG_4539 Alstroemeria hibrida( Peruvian lily or lily of the Incas)" href="http://farm3.static.flickr.com/2881/11190387313_07d3e4019e_b.jpg">
		            <img src="http://farm3.static.flickr.com/2881/11190387313_07d3e4019e_s.jpg">
		        </a>
		        <a data-gallery="" title="On the Move" href="http://farm4.static.flickr.com/3710/11190198736_329108ab33_b.jpg">
		            <img src="http://farm4.static.flickr.com/3710/11190198736_329108ab33_s.jpg">
		        </a>
		        <a data-gallery="" title="Twistleton Erratic Mystery Solved" href="http://farm4.static.flickr.com/3736/11188821145_4d7c5cba2d_b.jpg">
		            <img src="http://farm4.static.flickr.com/3736/11188821145_4d7c5cba2d_s.jpg">
		        </a>
		        <a data-gallery="" title="Welcome To Dream Theater" href="http://farm3.static.flickr.com/2888/11194228946_a22ca1273f_b.jpg">
		            <img src="http://farm3.static.flickr.com/2888/11194228946_a22ca1273f_s.jpg">
		        </a>
		        <a data-gallery="" title="Kingfisher 115" href="http://farm4.static.flickr.com/3761/11192804084_fc9c224b92_b.jpg">
		            <img src="http://farm4.static.flickr.com/3761/11192804084_fc9c224b92_s.jpg">
		        </a>
		        <a data-gallery="" title="Oh Christmas Tree, Oh Christmas Tree (A7 + FE 28-70mm)" href="http://farm3.static.flickr.com/2843/11188372516_d2b638c316_b.jpg">
		            <img src="http://farm3.static.flickr.com/2843/11188372516_d2b638c316_s.jpg">
		        </a>
		        <a data-gallery="" title="R�servoir" href="http://farm4.static.flickr.com/3772/11186008524_70203c9862_b.jpg">
		            <img src="http://farm4.static.flickr.com/3772/11186008524_70203c9862_s.jpg">
		        </a>
		        <a data-gallery="" title="Anna's Hummingbird" href="http://farm3.static.flickr.com/2879/11193622663_2596f23ccb_b.jpg">
		            <img src="http://farm3.static.flickr.com/2879/11193622663_2596f23ccb_s.jpg">
		        </a>
		        <a data-gallery="" title="India. Udaipur. Templo de Sas Bahu" href="http://farm4.static.flickr.com/3766/11191115443_ef304dab2d_b.jpg">
		            <img src="http://farm4.static.flickr.com/3766/11191115443_ef304dab2d_s.jpg">
		        </a>
		        <a data-gallery="" title="Afternoon Tea Treat" href="http://farm6.static.flickr.com/5546/11186477995_5e02323a9a_b.jpg">
		            <img src="http://farm6.static.flickr.com/5546/11186477995_5e02323a9a_s.jpg">
		        </a>
		        <a data-gallery="" title="0007559" href="http://farm4.static.flickr.com/3715/11192580616_2534046023_b.jpg">
		            <img src="http://farm4.static.flickr.com/3715/11192580616_2534046023_s.jpg">
		        </a>
		        <a data-gallery="" title="Li�ge-Guillemins" href="http://farm4.static.flickr.com/3813/11191726844_ef38874aa2_b.jpg">
		            <img src="http://farm4.static.flickr.com/3813/11191726844_ef38874aa2_s.jpg">
		        </a>
		        <a data-gallery="" title="autunno in Langa" href="http://farm8.static.flickr.com/7295/11186551094_fd7f6bb741_b.jpg">
		            <img src="http://farm8.static.flickr.com/7295/11186551094_fd7f6bb741_s.jpg">
		        </a>
		        <a data-gallery="" title="Junco" href="http://farm4.static.flickr.com/3775/11188715846_ccaaa3c859_b.jpg">
		            <img src="http://farm4.static.flickr.com/3775/11188715846_ccaaa3c859_s.jpg">
		        </a>
		        <a data-gallery="" title="illuminati" href="http://farm8.static.flickr.com/7390/11190619986_b01b312535_b.jpg">
		            <img src="http://farm8.static.flickr.com/7390/11190619986_b01b312535_s.jpg">
		        </a>
		        <a data-gallery="" title="Chicago on the prairie" href="http://farm8.static.flickr.com/7444/11192183673_9b5dc14b82_b.jpg">
		            <img src="http://farm8.static.flickr.com/7444/11192183673_9b5dc14b82_s.jpg">
		        </a>
		        <a data-gallery="" title="In the wee small hours" href="http://farm4.static.flickr.com/3690/11188858774_880657dfe5_b.jpg">
		            <img src="http://farm4.static.flickr.com/3690/11188858774_880657dfe5_s.jpg">
		        </a>
		        <a data-gallery="" title="Sunset at Rocca Calascio" href="http://farm4.static.flickr.com/3823/11188037413_12432dbd1b_b.jpg">
		            <img src="http://farm4.static.flickr.com/3823/11188037413_12432dbd1b_s.jpg">
		        </a>
		        <a data-gallery="" title="Autumn Woodland Walk" href="http://farm8.static.flickr.com/7445/11193295285_0e9a33b308_b.jpg">
		            <img src="http://farm8.static.flickr.com/7445/11193295285_0e9a33b308_s.jpg">
		        </a>
		        <a data-gallery="" title="The Scoop" href="http://farm4.static.flickr.com/3704/11189390906_9f6d188f6f_b.jpg">
		            <img src="http://farm4.static.flickr.com/3704/11189390906_9f6d188f6f_s.jpg">
		        </a>
		        <a data-gallery="" title="Night Messenger" href="http://farm3.static.flickr.com/2820/11187385286_22a1684442_b.jpg">
		            <img src="http://farm3.static.flickr.com/2820/11187385286_22a1684442_s.jpg">
		        </a>
		        <a data-gallery="" title="IMG_0986 (1)" href="http://farm6.static.flickr.com/5540/11194162765_82ff5370ba_b.jpg">
		            <img src="http://farm6.static.flickr.com/5540/11194162765_82ff5370ba_s.jpg">
		        </a>
		        <a data-gallery="" title="Opening in the reeds" href="http://farm8.static.flickr.com/7297/11194070595_8fbe773d36_b.jpg">
		            <img src="http://farm8.static.flickr.com/7297/11194070595_8fbe773d36_s.jpg">
		        </a>
		        <a data-gallery="" title="?? ~?????,  ????  of Oirase Keiryu~" href="http://farm4.static.flickr.com/3809/11192250074_96d068f6b6_b.jpg">
		            <img src="http://farm4.static.flickr.com/3809/11192250074_96d068f6b6_s.jpg">
		        </a>
		        <a data-gallery="" title="Blue and Gold" href="http://farm4.static.flickr.com/3724/11191614145_eeae8c7a2a_b.jpg">
		            <img src="http://farm4.static.flickr.com/3724/11191614145_eeae8c7a2a_s.jpg">
		        </a>
		        <a data-gallery="" title="NYC in Silhouette" href="http://farm6.static.flickr.com/5509/11188709506_8b49202344_b.jpg">
		            <img src="http://farm6.static.flickr.com/5509/11188709506_8b49202344_s.jpg">
		        </a>
		        <a data-gallery="" title="I hate love" href="http://farm4.static.flickr.com/3684/11187175694_f1e860e03f_b.jpg">
		            <img src="http://farm4.static.flickr.com/3684/11187175694_f1e860e03f_s.jpg">
		        </a>
		        <a data-gallery="" title="Jambatan Seri Warasan #2" href="http://farm8.static.flickr.com/7392/11192683083_c9bcc29620_b.jpg">
		            <img src="http://farm8.static.flickr.com/7392/11192683083_c9bcc29620_s.jpg">
		        </a>
		        <a data-gallery="" title="Flower lakeside" href="http://farm6.static.flickr.com/5517/11188543255_769549853a_b.jpg">
		            <img src="http://farm6.static.flickr.com/5517/11188543255_769549853a_s.jpg">
		        </a>
		        <a data-gallery="" title="Gobi Desert" href="http://farm4.static.flickr.com/3756/11186900993_40b7e05620_b.jpg">
		            <img src="http://farm4.static.flickr.com/3756/11186900993_40b7e05620_s.jpg">
		        </a>
		        <a data-gallery="" title="The Cradle of Light" href="http://farm8.static.flickr.com/7374/11191272254_b768cca1ab_b.jpg">
		            <img src="http://farm8.static.flickr.com/7374/11191272254_b768cca1ab_s.jpg">
		        </a>
		        <a data-gallery="" title="Matched up 337/365" href="http://farm6.static.flickr.com/5519/11190498386_b0e551fcd3_b.jpg">
		            <img src="http://farm6.static.flickr.com/5519/11190498386_b0e551fcd3_s.jpg">
		        </a>
		        <a data-gallery="" title="IMGP9696-stavrosstam" href="http://farm6.static.flickr.com/5483/11192544226_e76f7000ab_b.jpg">
		            <img src="http://farm6.static.flickr.com/5483/11192544226_e76f7000ab_s.jpg">
		        </a>
		        <a data-gallery="" title="IMG_3117" href="http://farm4.static.flickr.com/3758/11191372883_200105f62f_b.jpg">
		            <img src="http://farm4.static.flickr.com/3758/11191372883_200105f62f_s.jpg">
		        </a>
		        <a data-gallery="" title="A world apart..." href="http://farm3.static.flickr.com/2831/11189347715_9d8f5b400b_b.jpg">
		            <img src="http://farm3.static.flickr.com/2831/11189347715_9d8f5b400b_s.jpg">
		        </a>
		        <a data-gallery="" title="Lights on Cape Cod Bay" href="http://farm6.static.flickr.com/5490/11187042085_cd6483e25c_b.jpg">
		            <img src="http://farm6.static.flickr.com/5490/11187042085_cd6483e25c_s.jpg">
		        </a>
		        <a data-gallery="" title="second spring" href="http://farm4.static.flickr.com/3801/11196375183_f6abd5b25e_b.jpg">
		            <img src="http://farm4.static.flickr.com/3801/11196375183_f6abd5b25e_s.jpg">
		        </a>
		        <a data-gallery="" title="Perfect Landing" href="http://farm6.static.flickr.com/5503/11194858816_e46fc17ecd_b.jpg">
		            <img src="http://farm6.static.flickr.com/5503/11194858816_e46fc17ecd_s.jpg">
		        </a>
		        <a data-gallery="" title="Oh rose thou art sick..." href="http://farm4.static.flickr.com/3806/11189687433_9183bb0d19_b.jpg">
		            <img src="http://farm4.static.flickr.com/3806/11189687433_9183bb0d19_s.jpg">
		        </a>
		        <a data-gallery="" title="" href="http://farm8.static.flickr.com/7448/11188317995_4127b61baa_b.jpg">
		            <img src="http://farm8.static.flickr.com/7448/11188317995_4127b61baa_s.jpg">
		        </a>
		    </div>
		    <br>
		</div>
		<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
		<div id="blueimp-gallery" class="blueimp-gallery">
		    <!-- The container for the modal slides -->
		    <div class="slides"></div>
		    <!-- Controls for the borderless lightbox -->
		    <h3 class="title"></h3>
		    <a class="prev"></a>
		    <a class="next"></a>
		    <a class="close">×</a>
		    <a class="play-pause"></a>
		    <ol class="indicator"></ol>
		    <!-- The modal dialog, which will be used to wrap the lightbox content -->
		    <div class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <button type="button" class="close" aria-hidden="true">�</button>
		                    <h4 class="modal-title"></h4>
		                </div>
		                <div class="modal-body next"></div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-default pull-left prev">
		                        <i class="glyphicon glyphicon-chevron-left"></i>
		                        Previous
		                    </button>
		                    <button type="button" class="btn btn-primary next">
		                        Next
		                        <i class="glyphicon glyphicon-chevron-right"></i>
		                    </button>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<!-- Bootstrap JS is not required, but included for the responsive demo navigation and button states -->
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
		<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
		<script src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/bootstrap-image-gallery.js"></script>
		<script src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/demo.js"></script>

     
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>

</html>

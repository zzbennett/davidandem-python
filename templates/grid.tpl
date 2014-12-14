<html>
  <head>
    <title>David and Emillie's Wedding</title>
    <link rel="stylesheet" type="text/css" href="/static/css/maps.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/grid.css" />
    <link href='http://fonts.googleapis.com/css?family=Limelight' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
    <link href='/static/fonts/zakia-webfont.ttf' rel='stylesheet' type='text/css' />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    {% block javascript %}
      <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0/handlebars.min.js"></script>
{% raw %}
      <script type="text/x-handlebars-template" id="rollover-template">
        <div class="grid-image grid-off grid-off-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
             data-rollover-id="{{ row }}-{{ col }}"
             {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
             style="background-image: url('{{ imageObj.off }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px;">
             {{#if pageTitle }}
             <h2 class="grid-title grid-title-row-{{ row }}">{{ pageTitle }}</h2>
             {{/if}}
        </div>
        <div class="grid-image grid-on grid-on-{{ row }}-{{ col }} row{{ row }} col{{ col }}"
             data-rollover-id="{{ row }}-{{ col }}"
             {{#if imageObj.page }}data-page="{{ imageObj.page }}"{{/if}}
             style="background-image: url('{{ imageObj.on }}'); background-position: {{ imageObj.position.x }}px {{ imageObj.position.y }}px; opacity: 0.0;">
             {{#if pageTitle }}
             <h2 class="grid-title grid-title-row-{{ row }}">{{ pageTitle }}</h2>
             {{/if}}
        </div>
      </script>
{% endraw %}
      <script type="text/javascript" src="/static/js/de-grid.js"> </script>
      <script type="text/javascript">
$(document).ready(function() {
    // Needs to be rendered into the page.
    var photosLinks = {{ photo_links }};
    var currentIndex = 0;

    var photoCounter = $("#photo-counter");
    var photoImg = $("#photo-img");

    var showPhotoAtIndex = function(index) {
        var href = photosLinks[index].href;
        photoImg.attr("src", href);
        photoImg.parent("a").attr("href", href);
        photoCounter.text("photo " + (index + 1) + "/" + photosLinks.length);
    };

    var refreshImages = function(images) {
        photosLinks = images;
        showPhotoAtIndex(currentIndex);
        $("#upload-progress-indicator").hide();
    };

    $("#upload-photo-form").submit(function(e) {
        $.ajax({
            type: 'POST',
            url: '/photo-upload',
            data: new FormData(this),
            success: refreshImages,
            dataType: 'json',
            processData: false,
            contentType: false
        });
        $("#upload-progress-indicator").show();
        e.preventDefault();
    });

    // Setup initial image if there is one.
    if (photosLinks.length > 0) {
        showPhotoAtIndex(0);
    }

    // Forward button
    $("#forward-photo").click(function() {
        if (currentIndex + 1 < photosLinks.length) {
            showPhotoAtIndex(++currentIndex);
        }
    });
    // Backward button
    $("#backward-photo").click(function() {
        if (currentIndex - 1 >= 0) {
            showPhotoAtIndex(--currentIndex);
        }
    });
});
      </script>
    {% endblock javascript %}

  </head>
  <body>


    <!-- travel info -->
    <div id="travel-information" class="modal">
      <div class="modal-header">
        <span class="modal-title">Travel Information</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">Logistically, it makes almost no sense to get married in Denver. Neither we, nor most of you people even live there! We know that. But Denver is David’s hometown, and is a gorgeous backdrop for our upcoming nuptials. We love the city, the mountains and the people, so why not? </p>

	<p>The <a href="https://www.denverathleticclub.cc/Weddings?ssid=195228">Denver Athletic Club</a>, which is where the ceremony will occur, is located downtown, close to Coors Stadium, 16th Avenue Mall, and loads of restaurants and shops. It’s also only a few blocks away from <a href="http://www.thecurtis.com/contact/">The Cutis</a>, the hotel where we have reserved a block at a discounted rate for all of our lovely out of town guests (i.e. pretty much everyone). The logic behind this choice was based off the fact that the Curtis is hella close to the Denver Athletic Club and also centrally located. We didn’t want anyone to have to drive around, or get lost, or be late (you know who you are). So downtown it is!  To book at the Curtis, please follow this <a href=http://doubletree.hilton.com/en/dt/groups/personalized/D/DENCHDT-LBR-20150611/index.jhtml?WT.mc_id=POG>link</a> or call them at 303-571-0300 and ask to reserve for the Lingnau-Bennett wedding block. </p>

	<p>Since we’ll be tying the knot on Friday, June 12, we recommend that y’all fly in on the 11th, and stay the weekend at the Curtis if you can. Plus, if you all stay there, than you can all party it up together after I (Emillie) have run out of coffee and gone to sleep. The block is reserved from check in on the 11th to check out on the 14th for your convenience.</p>

        <h2>Map</h2>
	<!-- <iframe src="https://mapsengine.google.com/map/u/0/embed?mid=zKb6YkxKtQGA.kQRHsaBqmIiw" width="640" height="480" style="margin-left: calc(50% - 320px);"></iframe> -->
      </div>
    </div>


    <!-- photos -->
    <div id="photos" class="modal">
      <div class="modal-header">
        <span class="modal-title">Photos</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <!-- text before photo -->
        <div id="photo-modal-text">
          <p class="modal-text"> Hmmm… you know what this looks like? Looks like a great opportunity to upload any pictures you may have of Emillie and Dave that they might not know about. You know how bad they are about taking pictures? It’s ridiculous, considering how many of Emillie’s family members are photographers, that she’s so reticent to take any pictures. Idiot. </p>
	  <p>Anyway, if you have any, be they sweet, kinda weird, downright hilarious, whatever—Please leave them here!</p>
        </div>

        <!-- photo and associated widgets -->
        <div id="photo-modal-widgets">
          <!-- the actual photo -->
          <div id="photo-img-wrap">
            <a href="#" target="_blank"><img id="photo-img" /></a>
          </div>

          <!-- various gadgets underneath photo -->
          <div id="photo-img-footer">
            <!-- prev/next buttons -->
            <div id="photo-img-buttons-wrap">
              <button id="backward-photo">
                &lt;&lt; prev
              </button>
              <button id="forward-photo">
                next &gt;&gt;
              </button>
            </div>

            <!-- progress through photos -->
            <div id="photo-counter">
              X/Y
            </div>

            <!-- upload form -->
            <div id="form-wrap">
              <form id="upload-photo-form" method="POST" action="/photo-upload" enctype="multipart/form-data">
                <input type="file" name="photo_file" id="photo_file"
                       accept="image/bmp, image/gif, image/jpeg, image/tif, image/tiff, image/png" />
                       <input type="submit" value="upload" />
              </form>
              <img id="upload-progress-indicator" src="/static/images/ajax-loader.gif" />
            </div>
          </div>
        </div>
      </div>
    </div> <!-- end photos -->


    <!-- wedding day -->
    <div id="wedding-day" class="modal">
      <div class="modal-header">
        <span class="modal-title">Wedding Day</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <h3>Schedule of the day</h3>
        <p>Please check back later for more information about the schedule of events on June 12, 2015. Frankly, Emillie and Dave haven’t figured it out yet. It will probably involve rings or something though. </p>

        <h3>Where stuff is happening</h3>
	<p>What we can tell you as of now is that it will definitely be at the <a href="https://www.denverathleticclub.cc/Weddings?ssid=195228">Denver Athletic Club</a>, and there will definitely be both a ceremony and a reception and food. Emillie has been told there should probably be flowers too. Squeamish guest should be aware that there will be some kissing too, so please be prepared to be grossed out. </p>

        <img src="/static/images/dac-sundec.jpg"  style="margin-left: calc(50% - 270px);" class="modal-photo" />
      </div>
    </div>


    <!-- rsvp -->
    <div id="RSVP" class="modal">
      <div class="modal-header">
        <span class="modal-title">RSVP</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">Hey look at this fancy tech goodness! This is where you can RSVP! Online! Fill out the information and it will be popped into a spreadsheet that tracks who is coming and who is totally missing out. Thank god for Elizabeth Bennett (Fancy Tech Goddess)!</p>
	<p>You can also RSVP by phone, email, or by text, but not by fax. Faxes are an outdated technology and don’t get Emillie started on faxes or she’ll go on, and on, and on</p>
      <iframe src="https://docs.google.com/forms/d/1mq0wDmh_B0IH0GyEo9IadiqMR-OojvirPRwqnlPE4Dg/viewform?embedded=true" width="760" height="850" frameborder="0" marginheight="0" marginwidth="0" style="margin-left: calc(50% - 370px);" scrolling="no">Loading...</iframe>
      </div>
    </div>


    <!-- registry -->
    <div id="registry" class="modal">
      <div class="modal-header">
        <span class="modal-title">Registry</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
        <p class="modal-text">Please check back later for information on the registry, since as of right now, there isn’t one.</p>
        <img src="http://dailykitten.com/wp-content/uploads/2007/03/1173796830boris-bela-3.jpg" style="margin-left: calc(50% - 200px)" />
      </div>
    </div>


    <!-- about -->
    <div id="about" class="modal">
      <div class="modal-header">
        <span class="modal-title">About</span>
        <span class="modal-close"><a href="#">&times;</a></span>
      </div>
      <div class="modal-body">
	<img class="modal-photo" src="/static/images/david-and-em-funny.jpg" style="float:right" id="david-and-em-funny" />
        <h2>David Bennett</h2>
        <p class="about-paragraph">
	Dave is witty, wise, and whimsical. He’s also a gigantic goof ball, utterly frustrated by slow drivers and infuriated by slow internet connections. He likes coffee, Jelly Belly Jellybeans, and things that go <em>BWAAAAAAAA</em> (engines, guys, not Emillie’s T-Rex impressions). He won’t let Emillie watch Cowboy Bebop without him, and won’t play Mario Kart with her. He assures her the latter is because she won’t like him in the grips of his Kart-Rage. Surprising really, for someone who’s met Canadi-Em.<br> <br>
	David Bennett, as he is intimately known by Canadians, is currently stationed in Fort Walton Beach, Florida, where he enjoys regular sunburns due to his refusal to put oily products anywhere near contact with his skin (including those that remain ineffectually in their bottles). Neither he nor Emillie know what it is the Air Force is having him do there yet, but at least he now has time to contemplate buying a boat.</p>
        <h2 class="about-paragraph">Emillie Lingnau (soon to be Bennett!!!)</h2>
        <p class="about-paragraph">Emillie, AKA Beaner, Emma, Em, Emile (sigh), and Emillie-Emillie-Chicken-Neck, is, at the time of writing, still waiting on her green card so she can go to the states and mess with the people who hate immigrants. She is also looking forward to becoming a healthy brown colour. She enjoys coffee, food made with cream and cheese, free health-care, and spelling things in Canadian English, like centre, colour, touque and David Bennett. Emillie has been in love with Dave since he let her put her finger in his chin dimple, although if she’s honest it’s actually his eyes that drew her in.</p>
	<p class="about-paragraph">Emillie has a wicked bad potty mouth and a weird, undying love for the service industry which she hopes won’t come in handy in Florida for lack of an actual job. On the plus side, her continued efforts towards making sure every grumpy cougar in Calgary gets a glass of un-oaked chardonnay also mean that she’s usually awake late enough to intercept hilarious calls from Drunk Dave. If not, those calls would result in highly hilarious and embarrassing voice mails.  If she could do anything for work though, she’d be working in forensics, helping to dissect bodies because she’s a weirdo, and bodies are awesome.</p>
        <h2 class="about-paragraph">How We Met</h2>
	<p class="about-paragraph">Dave and Emillie met a few days before the first Sollee wedding back in 2010. Steven Sollee (Emillie’s eldest step-brother) met Dave when Steve did an exchange from West Point to the Air Force Academy and invited Dave down to Houston to be part of his wedding. Emillie made every possible excuse to hang out with the groomsmen the entire time.</p>
	<p class="about-paragraph">After the reception in Houston, Dave and Emillie had more time to chat at the after-party, but when he left, leaving Emillie only with a very small and thoroughly unsatisfying kiss. She shrugged, thinking, well shit, it’s not like I’m ever going to see him again anyway, and left it at that. Emillie was delighted when her scheming aunties got Dave’s number for her.</p>
	<p class="about-paragraph"><em>As a side note, this is when calling David by his full name started to become a thing. Since Emillie didn’t know, and couldn’t tell by judiciously creeping his Facebook thirty times a day, what his friends called him, she avoided the issue and just called him “David Bennett” and after some time, “David Bennett, my unofficial long distance-boyfriend”. David Bennett just stuck with the Canadians, and we’ve referred to him as such ever since. Frankly, as I write this, I am wondering if he would prefer to be called Dave or David uniformly throughout this website, rather than just interchangeably… Oh well, I’m certainly not going to type out David Bennett three thousand times here!</em></p>
	<p class="about-paragraph">When Emillie got home to Calgary after Steven’s wedding she sent Dave a cautious text saying how nice it was to have met him, and inviting him to drop her a line if ever he was in Calgary. He replied with the same, and invited her to drop him a line if ever she was in Denver, or Del Rio, Texas (she would never have thought to ever end up in Del Rio—ever.) However, as it was about six months after Steven’s wedding, Michael Sollee (Emillie’s middle step brother) finally read the writing on the wall that was firmly and in no uncertain terms telling him that his girlfriend Elizabeth should really become his wife, and proposed to her. Somehow, and Emillie suspects that her step-mother Sheri Lingnau did this on purpose, Emillie and her middle sister Alex ended up with a nine hour layover in Denver, Colorado on June 26th—her 22nd birthday. How very convenient! So Emillie called Dave and asked if he had any suggestions for ways to spend a ridiculously long layover in his home town. Dave regretfully told Emillie he would not be in town, but to check out Tamayo (his favorite restaurant in Denver) and 16th Avenue mall, and wished her a good time there.</p>
	<p class="about-paragraph">At this point it’s important to note that David Bennett is insane in the membrane. Between Christmas and June, Dave decided he needed to go home around midsummer. For about thirty-six hours.</p>
	<p class="about-paragraph">A little less than a week prior to Michael and Elizabeth’s wedding, Emillie received a text from Dave casually asking what time her and Alex would be flying into Denver. Apparently (to her) he would be visiting his parents that weekend after all, and could show them around town for the day! </p>
	<p class="about-paragraph">And that’s how it was. He picked them up, took them for an unbelievably necessary sugary coffee at Paris on the Platte, up Lookout Mountain, and finally home to Jan, Paul, and Fido Bennett. Jan has since remonstrated that she really had meant to be done baking before Dave brought Alex and Emillie to the house. Fido has since remonstrated—loudly—that he should have bit Emillie harder when he had the chance. Sadly they had to go back to the airport and catch flights home: Dave back to Del Rio and Alex and Emillie back to Calgary</p>
        <img src="/static/images/dave-and-em-SO-CUTE.jpg"  style="float:left" class="modal-photo" />
	<p class="about-paragraph">Finding that they all had some time to kill before their flights, the three travellers had a companionable pint at the New Belgium airport taproom, where the coasters double as postcards. Struck by inspiration (and two pints of Ranger IPA), Dave suggested that he and Emillie exchange addresses, for the completely legitimate necessity of trading delicious snacks not available in Canada and the US (Kinder Eggs, you poor, deprived people)</p>
	<p class="about-paragraph">The upshot to travelling with Alex is that she has an extremely small bladder. This fulfills two very important functions: first that normal people traveling with her are reminded to go to the washroom before their flights, since she’ll be going anyway, and second, that it results in excellently opportune moments for kissing the man of your dreams, and admitting that you’d really quite like to see him again. And that’s what Emillie did. Probably cutting off a little old lady walking behind her, she stopped, grabbed Dave by the hand and kissed him. (He sometimes argues that he kissed her, but that’s nonsense.)</p>
	<p class="about-paragraph">With promises to see each other soon, they boarded their flights and went home. The rest, as they say is history, but it was an exciting history, with some fights, some flights, and some airplanes. An adventure.</p>
      </div>
    </div>


    <div id="grid-wrap">
    </div>

    <!-- center medallion -->
    <div id="center-medallion">

      <div id="date-div">
          <h1>6.12.2015</h1>
      </div>

      <div id="david" class="medallian-name">
          <h1 id="david-h1">David</h1>
      </div>
      <div id="emillie" class="medallian-name">
          <h1 id="emillie-h1">Emillie</h1>
      </div>
    </div>
  </body>
</html>

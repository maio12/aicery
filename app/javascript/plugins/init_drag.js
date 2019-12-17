import swiped from "swiped";
import $ from 'jquery';

const dragInit = () => {

  console.log("swipe");



const element = document.querySelector('.index-list-card')
// const element = document.querySelector('.list')


const options = {
  query: ".index-list-card",
  right: 400,
  onOpen: function(event) {
      console.log(this["elem"].firstElementChild.href);
      this.destroy(true);
      $.ajax({
        url: this["elem"].firstElementChild.href,
        type: "DELETE",
        // data: { id: 1234},
          success:function(result){
            console.log("succes!")
        },
          error: function(richiesta,stato,errori){
          console.log("errore");
        }
});
    },
  tolerance: 200

  }
  if (element) {
  console.log("element exist")
  Swiped.init(options);
}
}

const dragInit2 = () => {

  console.log("swipe2");



const element2 = document.querySelector('.card-edit')
// const element = document.querySelector('.list')


const options2 = {
  query: ".card-edit",
  right: 400,
  onOpen: function(event) {
      let id = this["elem"].firstElementChild.id;
      this.destroy(true);
      $.ajax({
        url: "/items/" + id,
        type: "DELETE",
        // data: { id: 1234},
          success:function(result){
            console.log("succes!")
        },
          error: function(richiesta,stato,errori){
          console.log("errore");
        }
});
    },
  tolerance: 200

  }
  if (element2) {
  console.log("element exist2")
  Swiped.init(options2);
}
}




export { dragInit };
export { dragInit2 };


// const root = document.documentElement
// const card = document.querySelector('.index-list-card')

// if (window.PointerEvent) {
//   // Add Pointer Event Listener
//   card.addEventListener('pointerdown', this.handleGestureStart, true);
//   card.addEventListener('pointermove', this.handleGestureMove, true);
//   card.addEventListener('pointerup', this.handleGestureEnd, true);
//   card.addEventListener('pointercancel', this.handleGestureEnd, true);
// } else {
//   // Add Touch Listener
//   card.addEventListener('touchstart', this.handleGestureStart, true);
//   card.addEventListener('touchmove', this.handleGestureMove, true);
//   card.addEventListener('touchend', this.handleGestureEnd, true);
//   card.addEventListener('touchcancel', this.handleGestureEnd, true);

//   // Add Mouse Listener
//   card.addEventListener('mousedown', this.handleGestureStart, true);
// }

// // Handle the start of gestures
// this.handleGestureStart = function(evt) {
//   evt.preventDefault();

//   if(evt.touches && evt.touches.length > 1) {
//     return;
//   }

//   // Add the move and end listeners
//   if (window.PointerEvent) {
//     evt.target.setPointerCapture(evt.pointerId);
//   } else {
//     // Add Mouse Listeners
//     document.addEventListener('mousemove', this.handleGestureMove, true);
//     document.addEventListener('mouseup', this.handleGestureEnd, true);
//   }

//   initialTouchPos = getGesturePointFromEvent(evt);

//   swipeFrontElement.style.transition = 'initial';
// }.bind(this);

// const root = document.documentElement
// const body = document.body
// const header = document.querySelector('.index-list-card')
// const swipeLimit = 50


// let startX
// const endTouch = e => {

//   header.style.setProperty('background', 'limegreen')
//   console.log(e)
//   const finishingTouch = e.changedTouches[0].clientX
//   if (startX < finishingTouch - swipeLimit) {
//     console.log('Swiped Right')
//     header.textContent = 'Swiped Right'
//   } else if (startX > finishingTouch + swipeLimit) {
//     console.log('Swiped left')
//     header.textContent = 'Swiped left'
//   }
//   root.style.setProperty('--translate', 0)
//   body.removeElementListener('touchmove', moveTouch)
//   body.removeElementListener('touchend', endTouch)
// }
// // const moveTouch = e => {
// //   console.log('welcome from touch')
// //   // root.style.setProperty('--bg', 'dodgerblue')
// //   const progressX = startX - e.touches[0].clientX
// //   const translation =
// //     progressX > 0
// //       ? parseInt(-Math.abs(progressX))
// //       : parseInt(Math.abs(progressX))
// //   root.style.setProperty('--translate', translation)
// // }

// // const startTouch = e => {
// //   console.log('welcome from touch')
// //   const { touches } = e
// //   if (touches && touches.length === 1) {
// //     console.log('started touch')
// //     const touch = touches[0]
// //     startX = touch.clientX
// //     // body.root.setProperty('--bg', '#e74c3c')
// //     body.addEventListener('touchmove', moveTouch)
// //     body.addEventListener('touchend', endTouch)
// //   }
// // }

// // body.addEventListener('touchstart', startTouch)

// export { endTouch };
// // export { moveTouch };
// // export { startTouch };



// // import Draggabilly from 'draggabilly';


// // var proto = Draggabilly.prototype;

// // var pointerMove = proto.pointerMove;
// // proto.pointerMove = function( event, pointer ) {
// //   var moveVector = this._dragPointerMove( event, pointer );
// //   this.touchVerticalScrollMove( event, pointer, moveVector );
// //   pointerMove.apply( this, arguments );
// // }

// // proto.hasDragStarted = function( moveVector ) {
// //   return !this.isTouchScrolling && Math.abs( moveVector.x ) > 3;
// // };

// // proto.canPreventDefaultOnPointerDown = function() {
// //   return false;
// // };

// // var touchScrollEvents = {
// //   touchmove: true,
// //   MSPointerMove: true
// // };

// // proto.touchVerticalScrollMove = function( event, pointer, moveVector ) {
// //   var isTouchScrollEvent = touchScrollEvents[ event.type ];
// //   // start scrolling if touch event and y moved 10px
// //   if ( this.options.touchVerticalScroll && isTouchScrollEvent &&
// //       !this.isTouchScrolling && Math.abs( moveVector.y ) > 10 ) {
// //     this.isTouchScrolling = true;
// //   }
// // };

// // var pointerUp = proto.pointerUp;
// // proto.pointerUp = function() {
// //   pointerUp.apply( this, arguments );
// //   delete this.isTouchScrolling;
// // };

// // //------------------//


// // var projectsAll = document.querySelectorAll('.project');
// // // var draggies = []

// // function dismissIt (elem) {
// //   elem.classList.add('dismiss');
// //   setTimeout(function(){ removeIt(elem); },250);
// // };

// // function removeIt (elem) {
// //   elem.classList.add('remove');
// // };

// // function resetDrag(elem){
// //   elem.style.left = '0px';
// // }

// // function dragging (event, pointer, moveVector) {
// //   var elem = pointer.target;
// //   var threshold = elem.offsetWidth / -3;
// //   var farEnough = moveVector.x < threshold ? true : false;
// // }

// // function dragDone (event, pointer) {

// //   var elem = pointer.target;
// //   var item = event.target
// //   elem.style.height = elem.offsetHeight + 'px';



// //   var threshold = elem.offsetWidth / -3;

// //   // var farEnoughNo = moveVector.x < threshold ? true : false;
// //   console.log(event.pageX)
// //   var farEnough = event.pageX < 800 ? true : false

// //    if (farEnough) {
// //     const id = item.id.split('_')[1]
// //     console.log(id)
// //     dismissIt(elem);
// //     // fetch (
// //   } else {
// //     resetDrag(elem);
// //   }
// // }

// // function dragInit() {
// //   for (var i = 0, len = projectsAll.length; i < len; i++) {
// //     var draggableElem = projectsAll[i];
// //     var draggie = new Draggabilly(draggableElem, {
// //       'axis': 'x',
// //       touchVerticalScroll: true
// //     });
// //     // draggies.push(draggie);
// //     var farEnough;
// //     draggie.on('dragMove', dragging)
// //     draggie.on('dragEnd', dragDone)
// //   }
// // }


// // export { dragInit };

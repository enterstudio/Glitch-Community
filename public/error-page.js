var additionalStars, canvas, context, drawStar, height, i, initialStars, ref, stars, timedStars, width;

$(function() {
  width = $(document).width();
  height = $(document).height();
  stars = 1;
  additionalStars = Math.round((width * height) / 3500);
  initialStars = Math.round((width * height) / 15000);

  console.log(initialStars)

  canvas = $('#stars');
  context = canvas[0].getContext("2d");

  context.canvas.width = width;
  context.canvas.height = height;

  drawStar = function(color) {
    var min, x, y;
    context.fillStyle = color;
    min = 15;
    x = Math.random() * (width - min) + min;
    y = Math.random() * (height - min) + min;
    return context.fillRect(x, y, 2, 2);
  };

  for (i = 1, ref = initialStars; 1 <= ref ? i <= ref : i >= ref; 1 <= ref ? i++ : i--) {
    drawStar('white');
  }

  timedStars = function() {
    if (stars < additionalStars) {
      drawStar('#CB82C0');
      return stars++;
    }
  };

  setInterval(timedStars, 100);
});
import Chart from 'chart.js/auto';

document.addEventListener("DOMContentLoaded", function() {
  const data = {
    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    datasets: [{
      label: '# of Votes',
      data: [12, 19, 3, 5, 2, 3],
      backgroundColor: [
        'red',
        'blue',
        'yellow',
        'green',
        'purple',
        'orange',
      ],
      borderWidth: 1,
    }],
  };

  const ctx = document.getElementById('myChart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: data,
  });
});

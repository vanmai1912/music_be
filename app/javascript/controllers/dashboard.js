console.log("hihi");

import Chart from 'chart.js/auto';



document.addEventListener("DOMContentLoaded", function() {
  // Làm sáng quá trình tạo biểu đồ với các giá trị từ Ruby
  var clientData = JSON.parse('<%= @client_count.to_json %>');
  var singerData = JSON.parse('<%= @singer_count.to_json %>');
  var songData = JSON.parse('<%= @song_count.to_json %>');

  var clientChart = new Chart(document.getElementById("client-chart"), {
    type: "bar",
    data: {
      labels: ["Số lượng client"],
      datasets: [
        {
          label: "Số lượng",
          data: clientData,
          backgroundColor: "rgba(75, 192, 192, 0.2)",
          borderColor: "rgba(75, 192, 192, 1)",
          borderWidth: 1
        }
      ]
    }
  });

  var singerChart = new Chart(document.getElementById("singer-chart"), {
    type: "bar",
    data: {
      labels: ["Số lượng singer"],
      datasets: [
        {
          label: "Số lượng",
          data: singerData,
          backgroundColor: "rgba(255, 99, 132, 0.2)",
          borderColor: "rgba(255, 99, 132, 1)",
          borderWidth: 1
        }
      ]
    }
  });

  var songChart = new Chart(document.getElementById("song-chart"), {
    type: "bar",
    data: {
      labels: ["Số lượng song"],
      datasets: [
        {
          label: "Số lượng",
          data: songData,
          backgroundColor: "rgba(255, 159, 64, 0.2)",
          borderColor: "rgba(255, 159, 64, 1)",
          borderWidth: 1
        }
      ]
    }
  });
});

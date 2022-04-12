/* globals Chart:false, feather:false */

(function() {
    'use strict'

    feather.replace({ 'aria-hidden': 'true' })

    // Graphs
    var ctx1 = document.getElementById('myChart_T')
        // eslint-disable-next-line no-unused-vars
    var myChart1 = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: [
                '00:00',
                '02:00',
                '04:00',
                '06:00',
                '08:00',
                '10:00',
                '12:00',
                '14:00',
                '16:00',
                '18:00',
                '20:00',
                '22:00',
                '24:00'
            ],
            datasets: [{
                data: [
                10,
                10,
                15,
                20,
                25,
                30,
                25,
                20,
                20,
                20,
                15,
                20,
                28
                ],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false
            }
        }
    })
    
        // Graphs
    var ctx2 = document.getElementById('myChart_H')
        // eslint-disable-next-line no-unused-vars
    var myChart2 = new Chart(ctx2, {
        type: 'line',
        data: {
            labels: [
                '00:00',
                '01:00',
                '02:00',
                '03:00',
                '04:00',
                '05:00',
                '06:00',
                '07:00',
                '08:00',
                '09:00',
                '10:00',
                '11:00',
                '12:00',
                '13:00',
                '14:00',
                '15:00',
                '16:00',
                '17:00',
                '18:00',
                '19:00',
                '20:00',
                '21:00',
                '22:00',
                '23:00',
                '24:00'
            ],
            datasets: [{
                data: [
                10,
                10,
                15,
                20,
                25,
                30,
                25,
                20,
                20,
                20,
                15,
                20,
                22,
                23,
                24,
                25,
                25,
                25,
                25,
                27,
                22,
                23,
                24,
                26,
                28
                ],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false
            }
        }
    })
    
    
        // Graphs
    var ctx3 = document.getElementById('myChart_C')
        // eslint-disable-next-line no-unused-vars
    var myChart3 = new Chart(ctx3, {
        type: 'line',
        data: {
            labels: [
                '00:00',
                '01:00',
                '02:00',
                '03:00',
                '04:00',
                '05:00',
                '06:00',
                '07:00',
                '08:00',
                '09:00',
                '10:00',
                '11:00',
                '12:00',
                '13:00',
                '14:00',
                '15:00',
                '16:00',
                '17:00',
                '18:00',
                '19:00',
                '20:00',
                '21:00',
                '22:00',
                '23:00',
                '24:00'
            ],
            datasets: [{
                data: [
                10,
                10,
                15,
                20,
                25,
                30,
                25,
                20,
                20,
                20,
                15,
                20,
                22,
                23,
                24,
                25,
                25,
                25,
                25,
                27,
                22,
                23,
                24,
                26,
                28
                ],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false
            }
        }
    })
    
})()
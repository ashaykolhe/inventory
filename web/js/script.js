$(document).ready(function() {
    $('#po').autocomplete({
        url: '/Vendor.action?autopo=',
        minChars: 1,
        max: 10,
        width: 150,
        scroll: false
    });
    $('#city').autocomplete({
        url: '/Vendor.action?autovendor=',
        minChars: 1,
        max: 10,
        width: 150,
        scroll: false
    });
})

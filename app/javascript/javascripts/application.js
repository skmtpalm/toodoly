import $ from 'jquery';

(($) => {
  $('.task-text-toggle-nav').on('click', function() {
    const targetTaskId = $(this).data('target-task-id')

    $(`#task-text-${targetTaskId}`).toggleClass('is-active');
  })
})($)

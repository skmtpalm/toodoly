import jQuery from 'jquery';
import datepicker from '@fengyuanchen/datepicker';

(($) => {
  $('.task-text-toggle-nav').on('click', function() {
    const targetTaskId = $(this).data('target-task-id')

    $(`#task-text-${targetTaskId}`).toggleClass('is-active');
  })

  $('[data-toggle="datepicker"]').datepicker({
    format: 'yyyy/mm/dd'
  })

  // Deleted flash handler
  $('.flash-delete-button').on('click', function() {
    $('.flash-wrap').css({ display: 'none' });
  });

})(jQuery)

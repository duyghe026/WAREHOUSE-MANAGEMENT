<%@ page pageEncoding="utf-8"%>
<div class="ui modal" id="messagemodal">
	<div class="header">Thông Báo</div>
	<div class="content">
		<p>${message}</p>
	</div>
	<div class="actions">
		<div class="ui green cancel button">OK</div>
	</div>
</div>
<div class="ui modal" id="deleteconfirm">
	<div class="header">Cảnh Báo</div>
	<div class="content">
		<p>Bạn có chắc là muốn xóa không</p>
	</div>
	<div class="actions">
		<a id="delbtn">
			<div class="ui green button">Chấp nhận</div>
		</a>
		<div class="ui red cancel button">Hủy</div>
	</div>
</div>
<script charset="utf8" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script charset="utf8" src="https://code.jquery.com/jquery-3.1.1.min.js"
		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script> -->
<script charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script charset="utf8" src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js">
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js">
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js">
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json">
</script>

<script>
	function showModel(name, id) {
		document.getElementById('delbtn').setAttribute('href', 'admin/' + name + '/delete/' + id);
		$('#deleteconfirm').modal('show')
	}

	$(document).ready(function () {
		if (${message != null}) {
			$('#messagemodal').modal('show');
		}
		$('#mytable').DataTable({
			dom: 'Bfrtip',
			buttons: [
				'excel', {
					extend: 'pdfHtml5',
					exportOptions: {
						columns: [0, 1, 2, 3]
					}
				}
			],
			"order": [
				[0, "desc"]
			],
			"lengthMenu": [
				[5, 10, 20, -1],
				[5, 10, 20, "All"]
			],
			language: {
				url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
			},

		});
		$('#mytable2').DataTable({
			dom: 'Bfrtip',
			buttons: [
				'excel', 'pdf'
			],
			"lengthMenu": [
				[5, 10, 20, -1],
				[5, 10, 20, "All"]
			],
			language: {
				url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/vi.json'
			},
		});

		$('.ui.dropdown').dropdown();

	});
</script>
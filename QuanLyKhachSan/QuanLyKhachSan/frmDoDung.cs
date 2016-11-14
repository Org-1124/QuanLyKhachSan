using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKhachSan
{
    public enum LuaChon
    {
        Them,
        Sua,
        Xoa
    }
    public partial class frmDoDung : Form
    {
        DatabaseDataContext db = new DatabaseDataContext();
        LuaChon lc;
        public frmDoDung()
        {
            InitializeComponent();
        }


        private void frmDoDung_Load(object sender, EventArgs e)
        {
            LoadDataDoDung();
        }

        void LoadDataDoDung()
        {
            dgvDoDung.DataSource = db.tblDoDungs.Select(n => n);
            dgvDoDung.Columns["IDDoDung"].HeaderText = "Mã đồ dùng";
            dgvDoDung.Columns["TenDoDung"].HeaderText = "Tên đồ dùng";
            dgvDoDung.Columns["DonGia"].HeaderText = "Đơn giá";
            dgvDoDung.Columns["SoLuong"].HeaderText = "Số lượng";
            ChiDoc();
            HienButton();
        }

        void ChiDoc()
        {
            txtDonGia.ReadOnly = true;
            txtSoLuong.ReadOnly = true;
            txtTenDoDung.ReadOnly = true;
            txtIDDoDung.ReadOnly = true;
        }

        void ChoViet()
        {
            txtDonGia.ReadOnly = false;
            txtSoLuong.ReadOnly = false;
            txtTenDoDung.ReadOnly = false;
            txtIDDoDung.ReadOnly = false;
        }

        void AnButton()
        {
            btnHuy.Visible = true;
            btnLuu.Visible = true;
            btnThem.Visible = false;
            btnXoa.Visible = false;
            btnSua.Visible = false;
        }

        void HienButton()
        {
            btnThem.Visible = true;
            btnXoa.Visible = true;
            btnLuu.Visible = false;
            btnSua.Visible = true;
            btnHuy.Visible = false;
        }

        void ThemDoDung()
        {
            tblDoDung dd = new tblDoDung();
            if (dgvDoDung.Rows.Count <= 1) dd.IDDoDung = 1;
            else dd.IDDoDung = db.tblDoDungs.Select(n => n.IDDoDung).Max() + 1;
            dd.TenDoDung = txtTenDoDung.Text;
            if (txtSoLuong.Text == "") dd.SoLuong = null;
            else dd.SoLuong = int.Parse(txtSoLuong.Text);
            if (txtDonGia.Text == "") dd.DonGia = null;
            else dd.DonGia = int.Parse(txtDonGia.Text);
            db.tblDoDungs.InsertOnSubmit(dd);
            db.SubmitChanges();

        }

        void SuaDoDung()
        {
            tblDoDung dd = db.tblDoDungs.Where(n => n.IDDoDung == int.Parse(txtIDDoDung.Text)).First();
            dd.TenDoDung = txtTenDoDung.Text;
            if (txtSoLuong.Text == "") dd.SoLuong = null;
            else dd.SoLuong = int.Parse(txtSoLuong.Text);
            if (txtDonGia.Text == "") dd.DonGia = null;
            else dd.DonGia = int.Parse(txtDonGia.Text);
            db.SubmitChanges();
        }

        void XoaDoDung()
        {
            tblDoDung dd = db.tblDoDungs.Where(n => n.IDDoDung == int.Parse(txtIDDoDung.Text)).First();
            db.tblDoDungs.DeleteOnSubmit(dd);
            db.SubmitChanges();
        }

        private void dgvDoDung_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = dgvDoDung.SelectedRows[0];
            txtIDDoDung.Text = row.Cells["IDDoDung"].Value?.ToString();
            txtSoLuong.Text = row.Cells["SoLuong"].Value?.ToString();
            txtTenDoDung.Text = row.Cells["TenDoDung"].Value?.ToString();
            txtDonGia.Text = row.Cells["DonGia"].Value?.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            lc = LuaChon.Them;
            AnButton();
            ChoViet();
            txtDonGia.Clear();
            txtIDDoDung.Clear();
            txtSoLuong.Clear();
            txtTenDoDung.Clear();
            txtIDDoDung.Text = "Tự động sinh";
            txtIDDoDung.ReadOnly = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            switch (lc)
            {
                case LuaChon.Them:
                    ThemDoDung();
                    break;
                case LuaChon.Sua:
                    SuaDoDung();
                    break;
                case LuaChon.Xoa:
                    XoaDoDung();
                    break;
            }
            HienButton();
            LoadDataDoDung();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            lc = LuaChon.Sua;
            AnButton();
            ChoViet();
            txtIDDoDung.ReadOnly = true;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            lc = LuaChon.Xoa;
            AnButton();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            HienButton();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            dgvDoDung.DataSource = db.tblDoDungs.Where(n => n.TenDoDung.Contains(txtTimKiem.Text));
        }
    }
}

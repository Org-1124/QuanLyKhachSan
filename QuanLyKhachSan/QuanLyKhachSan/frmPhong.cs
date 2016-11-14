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
    public partial class frmPhong : Form
    {
        public enum LuaChon
        {
            Them,
            Sua,
            Xoa
        }
        DatabaseDataContext db = new DatabaseDataContext();
        LuaChon lc;
        public frmPhong()
        {
            InitializeComponent();
        }

        private void frmPhong_Load(object sender, EventArgs e)
        {
            LoadDataPhong();
        }
        private void LoadDataPhong()
        {
            dgvPhong.DataSource = db.tblPhongs.Select(n => n);
            dgvPhong.Columns["IDPhong"].HeaderText = "Số Phòng";
            dgvPhong.Columns["SucChua"].HeaderText = "Sức Chứa";
            dgvPhong.Columns["GiaPhong"].HeaderText = "Giá Phòng";
            dgvPhong.Columns["TrangThai"].HeaderText = "Trạng Thái";
            ChiDoc();
            HienButton();
        }
        void ChiDoc()
        {
            ckTrangThai.Enabled = false;
            txtGiaPhong.ReadOnly = true;
            txtSucChua.ReadOnly = true;
            txtIDPhong.ReadOnly = true;
        }
        void ChoViet()
        {
            ckTrangThai.Enabled = true;
            txtGiaPhong.ReadOnly = false;
            txtSucChua.ReadOnly = false;
            txtIDPhong.ReadOnly = false;
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

        void ThemPhong()
        {
            tblPhong dd = new tblPhong();
            if (dgvPhong.Rows.Count <= 1) dd.IDPhong = 1;
            else dd.IDPhong = db.tblPhongs.Select(n => n.IDPhong).Max() + 1;
            dd.SucChua = int.Parse(txtSucChua.Text);
            dd.GiaPhong = int.Parse(txtGiaPhong.Text);
            if (ckTrangThai.Checked == true) dd.TrangThai = "Đã Thuê";
            else dd.TrangThai = null;
            db.tblPhongs.InsertOnSubmit(dd);
            db.SubmitChanges();
        }
        void SuaPhong()
        {
            tblPhong dd = db.tblPhongs.Where(n => n.IDPhong == int.Parse(txtIDPhong.Text)).First();
            dd.SucChua = int.Parse(txtSucChua.Text);
            dd.GiaPhong = int.Parse(txtGiaPhong.Text);
            if (ckTrangThai.Checked == true) dd.TrangThai = "Đã Thuê";
            else dd.TrangThai = null;
            db.SubmitChanges();
        }
        void XoaPhong()
        {
            tblPhong dd = db.tblPhongs.Where(n => n.IDPhong == int.Parse(txtIDPhong.Text)).First();
            db.tblPhongs.DeleteOnSubmit(dd);
            db.SubmitChanges();
        }

        private void btnThem_Click_1(object sender, EventArgs e)
        {
            dgvPhong.Enabled = false;
            lc = LuaChon.Them;
            AnButton();
            ChoViet();
            ckTrangThai.Checked = false;
            txtIDPhong.Clear();
            txtGiaPhong.Clear();
            txtSucChua.Clear();
            if (dgvPhong.Rows.Count < 1) txtIDPhong.Text = "1";
            else txtIDPhong.Text = (db.tblPhongs.Select(n => n.IDPhong).Max() + 1).ToString();
            txtIDPhong.ReadOnly = true;
        }

        private void btnSua_Click_1(object sender, EventArgs e)
        {
            if (txtIDPhong.Text == "")
            {
                return;
            }
            dgvPhong.Enabled = false;
            if (txtIDPhong.Text == "") return;
            lc = LuaChon.Sua;
            AnButton();
            ChoViet();
            txtIDPhong.ReadOnly = true;
        }

        private void btnXoa_Click_1(object sender, EventArgs e)
        {
            if (txtIDPhong.Text == "") return;
            lc = LuaChon.Xoa;
            AnButton();
        }

        private void btnHuy_Click_1(object sender, EventArgs e)
        {
            txtIDPhong.Text = "";
            txtSucChua.Text = "";
            txtGiaPhong.Text = "";
            ckTrangThai.Checked = false;
            HienButton();
            dgvPhong.Enabled = true;
        }

        private void btnLuu_Click_1(object sender, EventArgs e)
        {
            if(txtSucChua.Text=="")
            {
                MessageBox.Show("Chưa Nhập Sức Chứa Của Phòng");
                return;
            }
            if (txtGiaPhong.Text == "")
            {
                MessageBox.Show("Chưa Nhập Giá Phòng");
                return;
            }
            switch (lc)
            {
                case LuaChon.Them:
                    ThemPhong();
                    break;
                case LuaChon.Sua:
                    SuaPhong();
                    break;
                case LuaChon.Xoa:
                    XoaPhong();
                    break;
            }
            HienButton();
            LoadDataPhong();
            dgvPhong.Enabled = true;
            ckTrangThai.Checked = false;
            txtIDPhong.Clear();
            txtGiaPhong.Clear();
            txtSucChua.Clear();
        }

        private void dgvPhong_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = dgvPhong.SelectedRows[0];
            txtIDPhong.Text = row.Cells["IDPhong"].Value.ToString();
            txtGiaPhong.Text = row.Cells["GiaPhong"].Value.ToString();
            txtSucChua.Text = row.Cells["SucChua"].Value.ToString();
            try { string s = row.Cells["TrangThai"].Value.ToString(); ckTrangThai.Checked = true; }
            catch { ckTrangThai.Checked = false; }
        }

        private void btnTimKiem_Click_1(object sender, EventArgs e)
        {
            try { dgvPhong.DataSource = db.tblPhongs.Where(n => n.IDPhong == int.Parse(txtTimKiem.Text)); }
            catch { LoadDataPhong(); }
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            btnTimKiem_Click_1(sender, e);
        }
    }
}
